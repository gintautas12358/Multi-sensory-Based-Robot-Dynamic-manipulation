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


#ifndef CONTROL_CORE_TYPE_GUARD_H
#define CONTROL_CORE_TYPE_GUARD_H


/*! \file type_guard.h
 * \brief Contains the utilities for enhancing the type safety of type classes.
 */


/*! \def OW_TYPE_GUARD(Class)
 * \brief Type guard macro for type classes.
 *
 * Place this marco on the very top of the type class that drives from the
 * TypeGuard class.
 *
 */
#define OW_TYPE_GUARD(Class) \
  protected: \
    Class(const TypeGuard&); \
    Class& operator=(const TypeGuard&);


namespace control_core
{
/*!
 * \brief The TypeGuard class.
 *
 * This is the type guard class. This class ensures that the different type
 * classes defined in the Open Walker project that derive from Eigen type
 * classes are not copy constructable or assignable to each other.
 *
 * Type classes that need to type safe need to derive from this class and
 * add the macro #OW_TYPE_GUARD(Class) at the very top of the class declaration:

  \code{.cpp}
    namespace control_core{

    template <typename _Scalar>
    class LinearPosition :
        public LinearPositionRef<Eigen::Matrix<_Scalar,3,1> >,
        public TypeGuard
    {
      OW_TYPE_GUARD(LinearPosition)

      // ...

    };

    } // namespace control_core
  \endcode


 *
 * E.g. The copy construction or assignment between LinearPosition and
 * LinearVelocity should never be allowed and throw an compilation error:

  \code{.cpp}
    cc::LinearPosition pos;
    cc::LinearVelocity vel;

    // Creates compilation error
    pos = vel;
  \endcode

 * \note The compilation errors are:
 *  - the copy constructor is protected
 *  - the assignment operator is ambiguous
 *
 * In the few cases where these type classes need to be assigned to each other
 * use static type casts to a common base class in the inheritance hierarchy,
 * e.g.:

  \code{.cpp}
    // Correct type conversion
    vel = static_cast<const cc::Vector3&>(pos);
  \endcode

 *
 */
class TypeGuard
{
public:
  /*!
   * \brief Default Constructor.
   */
  TypeGuard(){}
};

}  // namespace control_core

#endif  // CONTROL_CORE_TYPE_GUARD_H
