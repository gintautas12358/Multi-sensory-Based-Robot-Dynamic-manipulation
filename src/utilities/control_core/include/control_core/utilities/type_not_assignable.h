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

#ifndef CONTROL_CORE_TYPE_NOT_ASSIGNABLE_H
#define CONTROL_CORE_TYPE_NOT_ASSIGNABLE_H
  
  
/*! \def NOT_ASSIGNABLE(Class)
 * \brief Not assignable macro for c++ classes.
 *
 * Place this marco on the very top of the type class that should not be
 * assignable
 *
 */
#define OW_TYPE_NOT_ASSIGNABLE(Class) \
  protected: \
    Class(const Class&); \
    Class& operator=(const Class&);

#endif