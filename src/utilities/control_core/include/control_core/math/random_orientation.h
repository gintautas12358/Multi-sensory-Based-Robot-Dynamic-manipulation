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

#ifndef CONTROL_CORE_MATH_RANDOM_ORIENTATION_H
#define CONTROL_CORE_MATH_RANDOM_ORIENTATION_H

#include <random>
#include <Eigen/Geometry>

// the namespace for the project
namespace cc
{

  /*!
  * \brief Generate a random uniformly sampled Quaternion in S(3).
  * 
  * See: http://planning.cs.uiuc.edu/node198.html
  */
  template<typename Scalar, typename Generator>
  Eigen::Quaternion<Scalar> uniformRandomQuaternion(Generator& generator)
  {
    std::uniform_real_distribution<Scalar> uniform;

    Scalar u1 = uniform(generator);
    Scalar u2 = uniform(generator);
    Scalar u3 = uniform(generator);
    Scalar u_sqrt = std::sqrt(u1);
    Scalar u_sub_sqrt = std::sqrt(Scalar(1) - u1);

    return Eigen::Quaternion<Scalar>(
      u_sub_sqrt*std::sin(2*M_PI*u2), 
      u_sub_sqrt*std::cos(2*M_PI*u2),
      u_sqrt*std::sin(2*M_PI*u3),
      u_sqrt*std::cos(2*M_PI*u3));
  };

  /*!
  * \brief Generate a random uniformly sampled Rotation in SO(3).
  * 
  * See: http://planning.cs.uiuc.edu/node198.html
  */
  template<typename Scalar, typename Generator>
  Eigen::Matrix<Scalar,3,3> uniformRandomRotation(Generator& generator)
  {
    Eigen::Quaternion<Scalar> Q = uniformRandomQuaternion<Scalar>(generator);
    return Q.toRotationMatrix();
  };

} // namespace cc

#endif