
syms gx gy gz m1 m2 m3 m4 m5 m6 real
syms q1 q2 q3 q4 q5 q6 qp1 qp2 qp3 qp4 qp5 qp6 qpp1 qpp2 qpp3 qpp4 qpp5 qpp6 real 
syms L0 L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 L11 L12 real
syms i111 i112 i113 i122 i123 i133 real
syms i211 i212 i213 i222 i223 i233 real
syms i311 i312 i313 i322 i323 i333 real
syms i411 i412 i413 i422 i423 i433 real
syms i511 i512 i513 i522 i523 i533 real
syms i611 i612 i613 i622 i623 i633 real

DH = [q1 0 0 -pi/2;
        q2-pi/2 0 L3 0;
        q3 L2 L11 0;
        q4+pi/2 0 0 pi/2;
        q5 L12 0 -pi/2;
        q6 L4 0 0];
    
T0_W = [1 0 0 0;
        0 1 0 0;
        0 0 1 L1;
        0 0 0 1];

T1_0 = relativeTrans(DH(1,:));
T2_1 = relativeTrans(DH(2,:));
T3_2 = relativeTrans(DH(3,:));
T4_3 = relativeTrans(DH(4,:));
T5_4 = relativeTrans(DH(5,:));
T6_5 = relativeTrans(DH(6,:));
    
T2_0 = T1_0 * T2_1;
T3_0 = T2_0 * T3_2;
T4_0 = T3_0 * T4_3;
T5_0 = T4_0 * T5_4;
T6_0 = T5_0 * T6_5;

t1_0 = T1_0(1:3,4);
t2_0 = T2_0(1:3,4);
t3_0 = T3_0(1:3,4);
t4_0 = T4_0(1:3,4);
t5_0 = T5_0(1:3,4);
t6_0 = T6_0(1:3,4);

z0_0 = [0 0 1]';
z1_0 = T1_0(1:3,3);
z2_0 = T2_0(1:3,3);
z3_0 = T3_0(1:3,3);
z4_0 = T4_0(1:3,3);
z5_0 = T5_0(1:3,3);
z6_0 = T6_0(1:3,3);

J1_0 = [cross(z0_0, t6_0);
        z0_0];
J2_0 = [cross(z1_0, t6_0 - t5_0);
        z1_0];
J3_0 = [cross(z2_0, t6_0 - t4_0);
        z2_0];
J4_0 = [cross(z0_0, t6_0 - t3_0);
        z3_0];
J5_0 = [cross(z1_0, t6_0 - t2_0);
        z4_0];
J6_0 = [cross(z2_0, t6_0 - t1_0);
        z5_0];
    
J = [J1_0 J2_0 J3_0 J4_0 J5_0 J6_0];

Jdiff = [diff(t6_0, q1) diff(t6_0, q2) diff(t6_0, q3), diff(t6_0, q4) diff(t6_0, q5) diff(t6_0, q6)];

Jdiff =simplify(Jdiff);
J =simplify(J);

%test
isequal(J(1:3,:),Jdiff)

T1_W = T0_W * T1_0;
T2_W = T0_W * T2_0;
T3_W = T0_W * T3_0;
T4_W = T0_W * T4_0;
T5_W = T0_W * T5_0;
T6_W = T0_W * T6_0;

xef_w = T3_W(1:3,4);
xef_w = simplify(xef_w);

%% mass centers Jacobians

DHcm = [q1 L6-L1 0 0; % from joint 0 to cm 1
        q2 L7 L8 0; % from joint 1 to cm 2
        q3 L9+L2-L12 L10 0; % from joint 2 to cm 3
        q4 -L12 0 0; % from joint 3 to cm 4
        q5 L12 L8 0; % from joint 4 to cm 5
        q6 L4/2 0 0] % from joint 5 to cm 6

    
Tcm1_0 = relativeTrans(DHcm(1,:));
Tcm2_1 = relativeTrans(DHcm(2,:));
Tcm3_2 = relativeTrans(DHcm(3,:));
Tcm4_3 = relativeTrans(DHcm(4,:));
Tcm5_4 = relativeTrans(DHcm(5,:));
Tcm6_5 = relativeTrans(DHcm(6,:));

Tcm2_0 = T1_0 * Tcm2_1;
Tcm3_0 = T2_0 * Tcm3_2;
Tcm4_0 = T3_0 * Tcm4_3;
Tcm5_0 = T4_0 * Tcm5_4;
Tcm6_0 = T5_0 * Tcm6_5;

tcm1_0 = Tcm1_0(1:3,4);
tcm2_0 = Tcm2_0(1:3,4);
tcm3_0 = Tcm3_0(1:3,4);
tcm4_0 = Tcm4_0(1:3,4);
tcm5_0 = Tcm5_0(1:3,4);
tcm6_0 = Tcm6_0(1:3,4);

zcm1_0 = Tcm1_0(1:3,3);
zcm2_0 = Tcm2_0(1:3,3);
zcm3_0 = Tcm3_0(1:3,3);
zcm4_0 = Tcm4_0(1:3,3);
zcm5_0 = Tcm5_0(1:3,3);
zcm6_0 = Tcm6_0(1:3,3);

%% cm1

J1_0 = [cross(z0_0, tcm1_0);
        z0_0];
    
ze = zeros(6,1);

Jcm1 = [J1_0 ze ze ze ze ze];
Jcm1 = simplify(Jcm1);

Jcm1_diff = [diff(tcm1_0,q1) diff(tcm1_0,q2) diff(tcm1_0, q3)];
Jcm1_diff = simplify(Jcm1_diff);

Jcm1_v = Jcm1(1:3,:);
Jcm1_w = Jcm1(4:6,:);

%test
isequal(Jcm1_v,Jcm1_diff)

%% cm2

J1_0 = [cross(z0_0, tcm2_0);
        z0_0];
    
J2_0 = [cross(z1_0, tcm2_0 - t1_0);
    z1_0];

Jcm2 = [J1_0 J2_0 ze ze ze ze];
Jcm2 = simplify(Jcm2);

Jcm2_diff = [diff(tcm2_0,q1) diff(tcm2_0,q2) diff(tcm2_0, q3)];
Jcm2_diff = simplify(Jcm2_diff);

Jcm2_v = Jcm2(1:3,:);
Jcm2_w = Jcm2(4:6,:);

%test
isequal(Jcm2_v,Jcm2_diff)

%% cm3

J1_0 = [cross(z0_0, tcm3_0);
        z0_0];
    
J2_0 = [cross(z1_0, tcm3_0 - t1_0);
    z1_0];

J3_0 = [cross(z2_0, tcm3_0 - t2_0);
    z2_0];

Jcm3 = [J1_0 J2_0 J3_0 ze ze ze];
Jcm3 = simplify(Jcm3);

Jcm3_v = Jcm3(1:3,:);
Jcm3_w = Jcm3(4:6,:);

Jcm3_diff = [diff(tcm3_0,q1) diff(tcm3_0,q2) diff(tcm3_0, q3)];
Jcm3_diff = simplify(Jcm3_diff);

%test
isequal(Jcm3_v,Jcm3_diff)

%% cm4

J1_0 = [cross(z0_0, tcm4_0);
        z0_0];
    
J2_0 = [cross(z1_0, tcm4_0 - t1_0);
    z1_0];

J3_0 = [cross(z2_0, tcm4_0 - t2_0);
    z2_0];

J4_0 = [cross(z3_0, tcm4_0 - t3_0);
    z3_0];

Jcm4 = [J1_0 J2_0 J3_0 J4_0 ze ze];
Jcm4 = simplify(Jcm4);

Jcm4_v = Jcm4(1:3,:);
Jcm4_w = Jcm4(4:6,:);

Jcm4_diff = [diff(tcm4_0,q1) diff(tcm4_0,q2) diff(tcm4_0, q3) diff(tcm4_0, q4)];
Jcm4_diff = simplify(Jcm4_diff);

%test
isequal(Jcm4_v,Jcm4_diff)

%% cm5

J1_0 = [cross(z0_0, tcm5_0);
        z0_0];
    
J2_0 = [cross(z1_0, tcm5_0 - t1_0);
    z1_0];

J3_0 = [cross(z2_0, tcm5_0 - t2_0);
    z2_0];

J4_0 = [cross(z3_0, tcm5_0 - t3_0);
    z3_0];

J5_0 = [cross(z4_0, tcm5_0 - t4_0);
    z4_0];

Jcm5 = [J1_0 J2_0 J3_0 J4_0 J5_0 ze];
Jcm5 = simplify(Jcm5);

Jcm5_v = Jcm5(1:3,:);
Jcm5_w = Jcm5(4:6,:);

Jcm5_diff = [diff(tcm5_0,q1) diff(tcm5_0,q2) diff(tcm5_0, q3) diff(tcm5_0, q4) diff(tcm5_0, q5)];
Jcm5_diff = simplify(Jcm5_diff);

%test
isequal(Jcm5_v,Jcm5_diff)

%% cm6

J1_0 = [cross(z0_0, tcm6_0);
        z0_0];
    
J2_0 = [cross(z1_0, tcm6_0 - t1_0);
    z1_0];

J3_0 = [cross(z2_0, tcm6_0 - t2_0);
    z2_0];

J4_0 = [cross(z3_0, tcm6_0 - t3_0);
    z3_0];

J5_0 = [cross(z4_0, tcm6_0 - t4_0);
    z4_0];

J6_0 = [cross(z4_0, tcm6_0 - t5_0);
    z5_0];

Jcm6 = [J1_0 J2_0 J3_0 J4_0 J5_0 J6_0];
Jcm6 = simplify(Jcm6);

Jcm6_v = Jcm6(1:3,:);
Jcm6_w = Jcm6(4:6,:);

Jcm6_diff = [diff(tcm6_0,q1) diff(tcm6_0,q2) diff(tcm6_0, q3) diff(tcm6_0, q4) diff(tcm6_0, q5) diff(tcm6_0, q6)];
Jcm6_diff = simplify(Jcm6_diff);

%test
isequal(Jcm6_v,Jcm6_diff)

%% Motion equation matrices
Icm1 = [i111 i112 i113;
      i112 i122 i123;
      i113 i123 i133];

Icm2 = [i211 i212 i213;
      i212 i222 i223;
      i213 i223 i233];
  
Icm3 = [i311 i312 i313;
      i312 i322 i323;
      i313 i323 i333];

Icm4 = [i411 i412 i413;
      i412 i422 i423;
      i413 i423 i433];

Icm5 = [i511 i512 i513;
      i512 i522 i523;
      i513 i523 i533];

Icm6 = [i611 i612 i613;
      i612 i622 i623;
      i613 i623 i633];
  

M = inertia_matrix(m1, Jcm1, Icm1, Tcm1_0(1:3,1:3)) + ...
    inertia_matrix(m2, Jcm2, Icm2, Tcm2_0(1:3,1:3)) + ...
    inertia_matrix(m3, Jcm3, Icm3, Tcm3_0(1:3,1:3)) + ...
    inertia_matrix(m4, Jcm4, Icm4, Tcm4_0(1:3,1:3)) + ...
    inertia_matrix(m5, Jcm5, Icm5, Tcm5_0(1:3,1:3)) + ...
    inertia_matrix(m6, Jcm6, Icm6, Tcm6_0(1:3,1:3));


C = CC(M, [q1 q2 q3 q4 q5 q6], [qp1 qp2 qp3 qp4 qp5 qp6]);

g = [gx;gy;gz];

P = m1*g'*tcm1_0 + ...
    m2*g'*tcm2_0 + ...
    m3*g'*tcm3_0 + ...
    m4*g'*tcm4_0 + ...
    m5*g'*tcm5_0 + ...
    m6*g'*tcm6_0;

G = [diff(P, q1);
    diff(P, q2);
    diff(P, q3);
    diff(P, q4);
    diff(P, q5);
    diff(P, q6)];
    

%M = simplify(M);
%C = simplify(C);
%G = simplify(G);


% M == M' 
% test1 = isequal(M, transpose(M))

% N = -N^T
% N = diff(M,q1)*qp1+diff(M,q2)*qp2+diff(M,q3)*qp3+diff(M,q4)*qp4 +diff(M,q5)*qp5 +diff(M,q6)*qp6  - 2*C;
%N = simplify(expand(N));
% test2 = isequal(N, -transpose(N))

% X^T N X = 0
% x = rand(6,1)
% 0 == x' * N * x

%Qpp = [qpp1 qpp2 qpp3 qpp4 qpp5 qpp6];
%Qp = [qp1 qp2 qp3 qp4 qp5 qp6];
%D = M*Qpp + C*Qp + G;

 %expr = children(collect(expand(D),[i111 i112 i113 i122 i123 i133 i211 i212 i213 i222 i223 i233 i311 i312 i313 i322 i323 i333 ...
  %                               m1 m2 m3 L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 gx gy gz]))


function Mi = inertia_matrix(m, J, I, R)
    J_v = J(1:3,:);
    J_w = J(4:6,:);
    Mi = m*(J_v'*J_v) + J_w'*R*I*R'*J_w;
end 

function Ckj = CCe(Mkj, Mki, Mij, qi, qj, qk, qpi)
    Ckj = (diff(Mkj, qi) + diff(Mki, qj) - diff(Mij, qk))*qpi;
end

function cc = CC(M, q, qp)
    [ss, s] = size(q);
    
    for k=1:s
        for j=1:s            
            for i=1:s     
                
                if i == 1
                    c(k,j) = CCe(M(k,j), M(k,i), M(i,j), q(i),q(j),q(k),qp(i));
                else
                    c(k,j) = c(k,j) + CCe(M(k,j), M(k,i), M(i,j), q(i),q(j),q(k),qp(i));
                end
                
            end
        end
    end
    
    cc = 1/2 * c;
end

function I = I_diff(t)
    I = [t(2)^2 + t(3)^2 ,     t(1) * t(2), t(1) * t(3);
          t(1) * t(2)    , t(1)^2 + t(3)^2, t(2) * t(3);
          t(1) * t(3)    ,     t(2) * t(3), t(1)^2 + t(2)^2];  
end

