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


#ifndef CONTROL_CORE_VECTOR3_BASE_H
#define CONTROL_CORE_VECTOR3_BASE_H

#include <control_core/conversions.h>
#include <control_core/type_bases/vector_base.h>

namespace control_core
{
/*!
 * \brief The Vector3Base class.
 */
template <typename _Derived>
class Vector3Base :
    public VectorBase<_Derived>
{
public:
  typedef _Derived Derived;
  typedef VectorBase<Derived> Base;

public:
  /*!
   * \brief Assignment of tf::Vector3.
   */
  Vector3Base& operator=(const tf::Vector3& x)
  {
    vector3TFToEigen(x,Base::derived());
    return *this;
  }

  /*!
   * \brief Assignment of geometry_msgs::Vector3.
   */
  Vector3Base& operator=(const geometry_msgs::Vector3& x)
  {
    vector3MsgToEigen(x,Base::derived());
    return *this;
  }

  /*!
   * \brief Assignment of geometry_msgs::Point.
   */
  Vector3Base& operator=(const geometry_msgs::Point& x)
  {
    pointMsgToEigen(x,Base::derived());
    return *this;
  }

  /*!
   * \brief Conversion to tf::Vector3.
   */
  operator tf::Vector3() const
  {
    tf::Vector3 x;
    eigenToVector3TF(Base::derived(), x);
    return x;
  }

  /*!
   * \brief Conversion to geometry_msgs::Point.
   */
  operator geometry_msgs::Point() const
  {
    geometry_msgs::Point x;
    eigenToPointMsg(Base::derived(), x);
    return x;
  }

  /*!
   * \brief Conversion to geometry_msgs::Point.
   */
  operator geometry_msgs::Vector3() const
  {
    geometry_msgs::Vector3 x;
    eigenToVector3Msg(Base::derived(), x);
    return x;
  }

  /*!
   * \brief Conversion to tf::Vector3.
   */
  tf::Vector3 toVectorTF() const
  {
    return static_cast<tf::Vector3>(Base::derived());
  }

  /*!
   * \brief Conversion to geometry_msgs::Point.
   */
  geometry_msgs::Point toPointMsg() const
  {
    return static_cast<geometry_msgs::Point>(Base::derived());
  }

  /*!
   * \brief Conversion to geometry_msgs::Point.
   */
  geometry_msgs::Vector3 toVector3Msg() const
  {
    return static_cast<geometry_msgs::Vector3>(Base::derived());
  }
};

}  // namespace control_core

#endif  // CONTROL_CORE_VECTOR3_BASE_H
