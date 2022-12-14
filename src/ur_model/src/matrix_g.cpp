#ifndef MATRIX_G_H_
#define MATRIX_G_H_

#include <ur_model/ur_model.h>

using namespace ur;

void URModel::matrix_G(cc::VectorDof &G,
                        const cc::JointPosition &q) const
{
  cc::Scalar s1 = sin(q(0));
  cc::Scalar s4 = sin(q(3));
  cc::Scalar s5 = sin(q(4));
  cc::Scalar c2 = cos(q(1));
  cc::Scalar c5 = cos(q(4));
  cc::Scalar c2s1 = c2 * s1;
  cc::Scalar a43 = L12 * gx * m6;
  cc::Scalar a44 = L2 * gy * m3;
  cc::Scalar a45 = L2 * gy * m4;
  cc::Scalar a46 = L2 * gy * m5;
  cc::Scalar a47 = L2 * gy * m6;
  cc::Scalar a48 = L8 * gy * m2;
  cc::Scalar a49 = L2 * gx * m3;
  cc::Scalar a50 = L2 * gx * m4;
  cc::Scalar a51 = L2 * gx * m5;
  cc::Scalar a52 = L2 * gx * m6;
  cc::Scalar a53 = L8 * gx * m2;
  cc::Scalar a54 = L12 * gy * m6;
  cc::Scalar a78 = L12 * gz * m6;
  cc::Scalar b7 = (c2 * cos(q(0)) * cos(q(3)) * sin(q(2)) - s4 * cos(q(0)) * sin(q(1)) * sin(q(2)) + cos(q(0)) * cos(q(2)) * cos(q(3)) * sin(q(1)) + c2 * s4 * cos(q(0)) * cos(q(2))) * s5;
  cc::Scalar b8 = (c2 * cos(q(0)) * sin(q(2)) + cos(q(0)) * cos(q(2)) * sin(q(1))) * s4 + ((-cos(q(0)) * cos(q(2)) * cos(q(3))) * c2 + cos(q(0)) * cos(q(3)) * sin(q(1)) * sin(q(2)));
  cc::Scalar b9 = (cos(q(3)) * sin(q(2)) + s4 * cos(q(2))) * c2 + (cos(q(2)) * cos(q(3)) * sin(q(1)) + (-sin(q(1)) * sin(q(2))) * s4);
  cc::Scalar b10 = (s4 * sin(q(2)) - cos(q(2)) * cos(q(3))) * c2s1 + ((cos(q(3)) * sin(q(1)) * sin(q(2))) * s1 + (cos(q(2)) * sin(q(1))) * s1 * s4);
  cc::Scalar b11 = (c2s1 * s4 * cos(q(2)) + c2s1 * cos(q(3)) * sin(q(2)) - s1 * s4 * sin(q(1)) * sin(q(2)) + s1 * cos(q(2)) * cos(q(3)) * sin(q(1))) * s5;
  cc::Scalar b12 = (c2 * s4 * sin(q(2)) - c2 * cos(q(2)) * cos(q(3)) + s4 * cos(q(2)) * sin(q(1)) + cos(q(3)) * sin(q(1)) * sin(q(2))) * s5;
  cc::Scalar b13 = c2 * cos(q(2)) - sin(q(1)) * sin(q(2));
  cc::Scalar b14 = c2 * cos(q(0)) * sin(q(2)) + cos(q(0)) * cos(q(2)) * sin(q(1));
  cc::Scalar b15 = c2s1 * sin(q(2)) + s1 * cos(q(2)) * sin(q(1));
  cc::Scalar d1 = (m4 + m5 + m6) * L3 * gx + (L9 * m3) * gx;
  cc::Scalar d2 = (m4 + m5 + m6) * L3 * gy + (L9 * m3) * gy;
  cc::Scalar d3 = (L5 * m6 + L11 * m5) * gy;
  cc::Scalar d4 = (L5 * m6 + L11 * m5) * gx;
  cc::Scalar d5 = (m4 + m5 + m6) * L3 * gz + (L9 * m3) * gz;
  cc::Scalar d6 = (L5 * m6 + L11 * m5) * gz;

  G(0, 0) = (d3 * cos(q(0)) * cos(q(2)) + a54 * s5 * cos(q(0)) * sin(q(2))) * c2 * s4 + (a44 * cos(q(0)) + a45 * cos(q(0)) + a46 * cos(q(0)) + a47 * cos(q(0)) + a48 * cos(q(0)) + d2 * cos(q(0)) * cos(q(2)) + d3 * cos(q(0)) * cos(q(3)) * sin(q(2)) - a54 * s5 * cos(q(0)) * cos(q(2)) * cos(q(3))) * c2 + (-d4 * cos(q(2)) - a43 * s5 * sin(q(2))) * c2s1 * s4 + (a43 * s5 * cos(q(2)) * cos(q(3)) - a50 - a51 - a52 - a53 - d1 * cos(q(2)) - d4 * cos(q(3)) * sin(q(2)) - a49) * c2s1 + (d4 * sin(q(1)) * sin(q(2)) - a43 * s5 * cos(q(2)) * sin(q(1))) * s1 * s4 + (a54 * c5 + L4 * gy * m5 + L4 * gy * m6 + L10 * gy * m4 + d1 * sin(q(1)) * sin(q(2)) - d4 * cos(q(2)) * cos(q(3)) * sin(q(1)) - a43 * s5 * cos(q(3)) * sin(q(1)) * sin(q(2))) * s1 + (a54 * s5 * cos(q(0)) * cos(q(2)) * sin(q(1)) - d3 * cos(q(0)) * sin(q(1)) * sin(q(2))) * s4 + (a43 * c5 * cos(q(0)) + L4 * gx * m5 * cos(q(0)) + L4 * gx * m6 * cos(q(0)) + L10 * gx * m4 * cos(q(0)) - d2 * cos(q(0)) * sin(q(1)) * sin(q(2)) + d3 * cos(q(0)) * cos(q(2)) * cos(q(3)) * sin(q(1)) + a54 * s5 * cos(q(0)) * cos(q(3)) * sin(q(1)) * sin(q(2)));
  G(1, 0) = (m3 + m4 + m5 + m6) * L2 * c2 * gz + (L8 * m2) * c2 * gz + (-a44 * sin(q(1)) - a45 * sin(q(1)) - a46 * sin(q(1)) - a47 * sin(q(1)) - a48 * sin(q(1))) * s1 + (a43 * b7 + a54 * b11 + a78 * b12 - b8 * d4 - b10 * d3 + b9 * d6 - b14 * d1 - b15 * d2 + b13 * d5 - a49 * cos(q(0)) * sin(q(1)) - a50 * cos(q(0)) * sin(q(1)) - a51 * cos(q(0)) * sin(q(1)) - a52 * cos(q(0)) * sin(q(1)) - a53 * cos(q(0)) * sin(q(1)));
  G(2, 0) = a43 * b7 + a54 * b11 + a78 * b12 - b8 * d4 - b10 * d3 + b9 * d6 - b14 * d1 - b15 * d2 + b13 * d5;
  G(3, 0) = a43 * b7 + a54 * b11 + a78 * b12 - b8 * d4 - b10 * d3 + b9 * d6;
  G(4, 0) = (c2 * cos(q(0)) * sin(q(2)) + cos(q(0)) * cos(q(2)) * sin(q(1))) * a43 * c5 * s4 + (cos(q(0)) * cos(q(3)) * sin(q(1)) * sin(q(2)) - c2 * cos(q(0)) * cos(q(2)) * cos(q(3))) * a43 * c5 + (-s1 * s5) * a43 + (c2s1 * sin(q(2)) + s1 * cos(q(2)) * sin(q(1))) * a54 * c5 * s4 + (s1 * cos(q(3)) * sin(q(1)) * sin(q(2)) - c2s1 * cos(q(2)) * cos(q(3))) * a54 * c5 + (s5 * cos(q(0))) * a54 + (a78 * sin(q(1)) * sin(q(2)) - a78 * c2 * cos(q(2))) * c5 * s4 + (-a78 * cos(q(2)) * cos(q(3)) * sin(q(1)) - a78 * c2 * cos(q(3)) * sin(q(2))) * c5;
}

#endif