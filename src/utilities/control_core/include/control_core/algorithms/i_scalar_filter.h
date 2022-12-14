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


#ifndef CONTROL_CORE_I_SCALAR_FILTER_H
#define CONTROL_CORE_I_SCALAR_FILTER_H

#include <control_core/algorithms/i_scalar_algorithm.h>

namespace control_core{

/*!
 * \brief The IScalarFilter class.
 *
 * The interface class for scalar filters.
 * This class describes the interface for all single input single
 * output (SISO) filters.
 */
template <typename _Scalar>
class IScalarFilter :
  public IScalarAlgorithm<_Scalar>
{
public:
  typedef _Scalar Scalar;

public:
  /*!
   * \brief Virtual destructor.
   */
  virtual ~IScalarFilter()
  {
  }

  /*!
   * \brief The filters order.
   * 
   * \returns the order \f$\mathScalar{d}\f$ of the computed filter.
   */
  virtual int order() const = 0;

  /*!
   * \brief the filters lower cutoff frequency.
   */
  virtual Scalar lowerCutoffFrequency() const = 0;

  /*!
   * \brief the filters upper cutoff frequency.
   */
  virtual Scalar upperCutoffFrequency() const = 0;

  /*!
   * \brief the signal sampling frequency.
   */
  virtual Scalar sampleFrequency() const = 0;

};

} // namespace control_core

#endif // CONTROL_CORE_I_SCALAR_FILTER_H
