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


#ifndef CONTROL_CORE_ANGULAR_POSITION_BASE_H
#define CONTROL_CORE_ANGULAR_POSITION_BASE_H

#include <control_core/conversions.h>
#include <control_core/type_bases/quaternion_base.h>

namespace control_core{

/*!
 * \brief The AngularPositionBase class.
 */
template <typename _Derived>
class AngularPositionBase :
    public QuaternionBase<_Derived>
{
public:
  typedef _Derived Derived;
  typedef QuaternionBase<Derived> Base;

public:
  using Base::operator=;

};

}  // namespace control_core

#endif  // CONTROL_CORE_ANGULAR_POSITION_BASE_H
