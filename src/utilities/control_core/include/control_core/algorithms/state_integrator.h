/*! \file
 *
 * \author Simon Armleder
 *
 * \copyright Copyright 2020 Institute for Cognitive Systems (ICS),
 *    Technical University of Munich (TUM)
 *
 * #### Licence
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

#ifndef CONTROL_CORE_STATE_INTEGRATOR_H
#define CONTROL_CORE_STATE_INTEGRATOR_H

#include <ros/assert.h>

#include <control_core/types.h>
#include <control_core/utilities/type_not_assignable.h>

#include <control_core/math/quaternion.h>
#include <control_core/algorithms/matrix_algorithm.h>

namespace control_core
{

  /*!
 * \brief The StateIntegrator class.
 *
 * This class takes the current acceleration/velocity and integrates it
 * a position. For now we are using simple euler integration.
 * 
 * Optionally the integrator takes upper and lower bound to limit the integal.
 *
 * The _Derived template parameter has to be derived from
 * control_core::StateBase thus belong to the group of
 * state type classes.
 * 
 */
  template <typename _Derived>
  class StateIntegrator
  {
    OW_TYPE_NOT_ASSIGNABLE(StateIntegrator)

  public:
    typedef _Derived Derived;

    typedef typename cc::traits<Derived>::Scalar Scalar;
    typedef typename cc::traits<Derived>::Pos V;
    typedef typename cc::traits<Derived>::Vel VP;
    typedef typename cc::traits<Derived>::Acc VPP;
    typedef typename cc::traits<Derived>::Effort VF;

  protected:
    cc::Scalar dt_; // the timestep size

    bool is_init_;
    bool has_bounds_;           // velocity and position bounds
    bool from_acceleration_;    // integrate from acceleration or velocity

    VP vel_lo_, vel_up_;        // integration limits
    V pos_lo_, pos_up_;

    Derived state_prev_;        // previous state
    V pos_pred_;                // predicted position
    VP vel_pred_;               // predicted velocity

  public:
    /*!
   * \brief Constructor.
   *
   */
    StateIntegrator(const cc::Scalar &dt, bool from_acceleration = true) : 
        dt_(dt),
        has_bounds_(false),
        is_init_(false),
        from_acceleration_(from_acceleration),
        state_prev_(Derived::Zero()),
        pos_pred_(V::Zero()),
        vel_pred_(VP::Zero())
    {
    }

    StateIntegrator(
        const cc::Scalar &dt,
        const V &pos_lo,
        const V &pos_up,
        const VP &vel_lo,
        const VP &vel_up,
        bool from_acceleration = true) : 
          dt_(dt),
          has_bounds_(true),
          is_init_(false),
          pos_lo_(pos_lo),
          pos_up_(pos_up),
          vel_lo_(vel_lo),
          vel_up_(vel_up),
          from_acceleration_(from_acceleration),
          state_prev_(Derived::Zero()),
          pos_pred_(V::Zero()),
          vel_pred_(VP::Zero())
    {
    }

    /*!
   * \brief Deconstructor.
   */
    ~StateIntegrator()
    {
    }

    cc::Scalar deltaTime()
    {
      return dt_;
    }

    /*!
   * \brief reset the integrator
   */
    void reset()
    {
      state_prev_.setZero();
    }

    /*!
   * \brief reset the integrator to value.
   */
    void reset(const Derived &value)
    {
      state_prev_ = value;
    }

    /*!
   * \brief Update the integrator for the next step.
   *
   * Uses the acceleration in state to update the velocity and position in 
   * state.
   * 
   * If no acceleration information is available it should be set to zero
   * before calling this function. In this case only velocities are integrated
   * to positions.
   *
   * \returns the updated state.
   */
    Derived &update(Derived &state)
    {
      // if not initalized set to current state
      if (!is_init_)
      {
        is_init_ = true;
        state_prev_ = state;
      }

      // integrate the acceleration to a velocity or use the input velocity
      if(from_acceleration_)
      {
        integrateToVelocity(vel_pred_, state.acc());
        if (has_bounds_)
        {
          enforce_limits(vel_pred_, state.acc(), vel_lo_, vel_up_);
        }
      }
      else
      {
        vel_pred_ = state.vel();
      }

      // integrate the velocity to a position
      integrateToPosition(pos_pred_, vel_pred_);
      if (has_bounds_)
      {
        enforce_limits(pos_pred_, vel_pred_, pos_lo_, pos_up_);
      }

      // update the previous state
      state_prev_ = state;

      // set integrated variables
      state.pos() = pos_pred_;
      state.vel() = vel_pred_;
      
      return state;
    }

  protected:
    /*!
    * \brief Conversion of Velocity Type to a Position Type
    * 
    * This function covers the general case for which the velocity is 
    * directly given by the time derivative of the position.
    */
    template <typename Derived1, typename Derived2>
    void integrateToPosition(
        Eigen::MatrixBase<Derived1> &pos,
        const Eigen::MatrixBase<Derived2> &vel)
    {
      // heun
      pos = state_prev_.pos() + 0.5 * dt_ * (vel + state_prev_.vel());
    }

    /*!
    * \brief Conversion of Position Type to Velocity Type
    * 
    * This function covers the special case for AngularPositions to 
    * AngularVelocities. This requires the time derivative of the
    * AngularPosition and the current AngularPosition.
    */
    template <typename Derived1>
    void integrateToPosition(
        cc::AngularPosition &pos,
        const control_core::AngularVelocityBase<Derived1> &omega)
    {
      cc::AngularPosition Q = pos;
      cc::quaternionIntegration(pos, Q, omega, dt_);
    }

    /*!
    * \brief Conversion of Position Type to Velocity Type
    * 
    * This function covers the special case for CartesianPositions to 
    * CartesianVelocities. This requires the time derivative of the
    * CartesianPosition and the current CartesianPosition.
    */
    void integrateToPosition(
        cc::CartesianPosition &pos,
        const cc::CartesianVelocity &XP)
    {
      // linear part (heun)
      pos.linear() = state_prev_.pos().linear() + 0.5 * dt_ * (XP.linear() + state_prev_.vel().linear());

      // angular part assuming constant angular velocity XP over dt_
      cc::AngularPosition Q = pos.angular();
      cc::quaternionIntegration(pos.angular(), Q, XP.angular(), dt_);
    }

    /*!
    * \brief Conversion of Acceleration Type to Velocity Type
    * 
    * This function covers the general case for which the acceleration is 
    * directly given by the time derivative of the velocity.
    * \note there is no special case, everything is cartesian.
    */
    template <typename Derived1, typename Derived2>
    void integrateToVelocity(
        Eigen::MatrixBase<Derived1> &vel,
        const Eigen::MatrixBase<Derived2> &acc)
    {
      // heun
      vel = state_prev_.vel() + 0.5 * dt_ * (acc + state_prev_.acc());
    }

    //----------------------------------------------------------------------------

    /*!
    * \brief Bound the value to a given range.
    * 
    * This function bound value val to the position/velocity.
    * And sets the derivative valP to zero if the bound is exceeded.
    */
    template <typename Derived1, typename Derived2, typename Derived3>
    void enforce_limits(
        Eigen::MatrixBase<Derived1> &val,
        Eigen::MatrixBase<Derived2> &valP,
        const Eigen::MatrixBase<Derived3> &val_lower,
        const Eigen::MatrixBase<Derived3> &val_upper)
    {
      //cc::clampSetZero(val, valP, val_lower, val_upper);
    }

    template <typename Derived1>
    void enforce_limits(
        cc::AngularPosition &Q,
        control_core::AngularVelocityBase<Derived1> &omega,
        const cc::AngularPosition &Q_lower,
        const cc::AngularPosition &Q_upper)
    {
      /* convert everything to euler
      cc::Vector3 rpy_lower = Q_lower.eulerAngles(0,1,2);
      cc::Vector3 rpy_upper = Q_upper.eulerAngles(0,1,2);
      cc::Vector3 rpy = Q.eulerAngles(0,1,2);

      cc::clamp(rpy, rpy_lower, rpy_upper);
      cc::clampSetZero(rpy, omega, rpy_lower, rpy_upper);*/
    }

    void enforce_limits(
        cc::CartesianPosition &X,
        cc::CartesianVelocity &XP,
        const cc::CartesianPosition &X_lower,
        const cc::CartesianPosition &X_upper)
    {
      /*for(size_t i = 0; i < X.linear().size(); ++i)
      {
        if(X.linear()(i) > X_upper.linear()(i))
        {
          X.linear()(i) = X_upper.linear()(i);
          XP.linear()(i) = 0.0;
        }
        else if(X.linear()(i) < X_lower.linear()(i))
        {
          X.linear()(i) = X_lower.linear()(i);
          XP.linear()(i) = 0.0;
        }
      }
      cc::clampSetZero(X.linear(), XP.linear(), X_lower.linear(), X_upper.linear());

      cc::Vector3 rpy_lower = X_lower.angular().eulerAngles(0,1,2);
      cc::Vector3 rpy_upper = X_upper.angular().eulerAngles(0,1,2);
      cc::Vector3 rpy = X.angular().eulerAngles(0,1,2);
      cc::clamp(rpy, rpy_lower, rpy_upper);
      X.angular() = cc::Rotation3::RPY(rpy);*/
    }
  };

} // namespace control_core

#endif // CONTROL_CORE_STATE_DERIVATIVES_UPDATER_H
