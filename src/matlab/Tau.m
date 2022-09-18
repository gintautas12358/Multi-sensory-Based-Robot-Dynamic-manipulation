function [ tau ] = Tau( u )
%TAU Summary of this function goes here
%   Detailed explanation goes here
% Times are defined in TrajGen.m file
global t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 to_home Theta Theta_hat

t=u(1);
    
op = u(64);
if (op) 
    xd=(u(2));
    yd=(u(3));
    zd=(u(4));

    xdp=(u(5));
    ydp=(u(6));
    zdp=(u(7));
    
    Xd = [xd;yd;zd];
    Xdp = [xdp;ydp;zdp];
else
   q1d=deg2rad(u(2));
    q2d=deg2rad(u(3));
    q3d=deg2rad(u(4));

    q1dp=deg2rad(u(5));
    q2dp=deg2rad(u(6));
    q3dp=deg2rad(u(7)); 
    
    Qd=[q1d;q2d;q3d];
    Qdp=[q1dp;q2dp;q3dp];
end



Kd=diag([u(8);u(9);u(10)]);
Kp=diag([u(11);u(12);u(13)]);

q1=u(14);
q2=u(15);
q3=u(16);

qp1=u(17);
qp2=u(18);
qp3=u(19);

Q=[q1;q2;q3];
Qp=[qp1;qp2;qp3];



%Joint Errors


%Robot Parameters

m1=u(20);
m2=u(21);
m3=u(22);
g=u(23);

L1=u(24);
L2=u(25);
L4=u(26);
L6=u(27);
L7=u(28);
L9=u(29);
L3=u(30);
L5=u(31);
L8=u(32);
L10=u(33);

i111= u(40);
i112=u(41);
i113=u(42);
i122=u(43);
i123=u(44);
i133=u(45);

i211=u(46);
i212=u(47);
i213=u(48);
i222=u(49);
i223=u(50);
i233=u(51);

i311=u(52);
i312=u(53);
i313=u(54);
i322=u(55);
i323=u(56);
i333=u(57);


L0 = 0.1157;

%Kis=diag([u(37);u(38);u(39)]);
Ki=diag([u(34);u(35);u(36)]);

gx=u(37);
gy=u(38);
gz=u(39);


%control sequence


Jv = [L5*sin(q1)*sin(q2)*sin(q3) - L3*cos(q2)*sin(q1) - L5*cos(q2)*cos(q3)*sin(q1) - cos(q1)*(L2 + L4), -cos(q1)*(L5*sin(q2 + q3) + L3*sin(q2)), -L5*sin(q2 + q3)*cos(q1); L3*cos(q1)*cos(q2) - sin(q1)*(L2 + L4) + L5*cos(q1)*cos(q2)*cos(q3) - L5*cos(q1)*sin(q2)*sin(q3), -sin(q1)*(L5*sin(q2 + q3) + L3*sin(q2)), -L5*sin(q2 + q3)*sin(q1); 0, - L5*cos(q2 + q3) - L3*cos(q2), -L5*cos(q2 + q3)];

m = abs(det(Jv));

if (t == 0)
        Theta =  [i133; i211; i212; i213; i222; i223; i233; i311; i312; i313; i322; i323; i333; L0^2*m3; L2^2*m3; L3^2*m3; L7^2*m2; L8^2*m2; L10^2*m3; L0*L2*m3; L0*L3*m3; L2*L3*m3; L0*L9*m3; L0*L10*m3; L2*L9*m3; L2*L10*m3; L3*L9*m3; L3*L10*m3; L7*L8*m2; L9*L10*m3; L0*gx*m3; L2*gx*m3; L3*gx*m3; L7*gx*m2; L8*gx*m2; L10*gx*m3; L0*gy*m3; L2*gy*m3; L3*gy*m3; L7*gy*m2; L8*gy*m2; L10*gy*m3; L3*gz*m3; L8*gz*m2; L10*gz*m3; L9*gx*m3; L9^2*m3; L9*gy*m3];
        error_portion = 0.2;
        Theta_hat = (1-error_portion)*Theta;
end

if (op)
    
    if (m < 0.05)
        to_home = true;       
    end
    
    X = ef(Q);
    Xp = Jv * Qp;
    DeltaX = X -Xd;
    DeltaXp = Xp - Xdp;
    DeltaXi = [u(58); u(59); u(60)];
    
    a = diag([0.3; 0.3; 0.6]);
    c = diag([0.1; 0.1; 0.1]);
    %PD
    %Xrp = Xdp - a*Kp*DeltaX;
    %PID
    Xrp = Xdp - a*Kp*DeltaX -c*Ki*DeltaXi;
    Sx = Xp - Xrp;
    
    Qrp = Jv \ Xrp;
    qrp1 = Qrp(1);
    qrp2 = Qrp(2);
    qrp3 = Qrp(3);

    Qrpp = [u(61);u(62);u(63)];
    qrpp1 = Qrpp(1);
    qrpp2 = Qrpp(2);
    qrpp3 = Qrpp(3);
    
    b = 10*diag([0.1; 0.1; 0.1]);
    Yr =  [qrpp1, qrpp1/2 - (qrpp1*cos(2*q2))/2 + (qp1*qrp2*sin(2*q2))/2 + (qp2*qrp1*sin(2*q2))/2, qrpp1*sin(2*q2) + qp1*qrp2*cos(2*q2) + qp2*qrp1*cos(2*q2), - qrpp2*sin(q2) - qp2*qrp2*cos(q2), qrpp1/2 + (qrpp1*cos(2*q2))/2 - (qp1*qrp2*sin(2*q2))/2 - (qp2*qrp1*sin(2*q2))/2, qp2*qrp2*sin(q2) - qrpp2*cos(q2), 0, qrpp1/2 - (qrpp1*cos(2*q2 + 2*q3))/2 + (qp1*qrp2*sin(2*q2 + 2*q3))/2 + (qp2*qrp1*sin(2*q2 + 2*q3))/2 + (qp1*qrp3*sin(2*q2 + 2*q3))/2 + (qp3*qrp1*sin(2*q2 + 2*q3))/2, qrpp1*sin(2*q2 + 2*q3) + qp1*qrp2*cos(2*q2 + 2*q3) + qp2*qrp1*cos(2*q2 + 2*q3) + qp1*qrp3*cos(2*q2 + 2*q3) + qp3*qrp1*cos(2*q2 + 2*q3), - qrpp2*sin(q2 + q3) - qrpp3*sin(q2 + q3) - qp2*qrp2*cos(q2 + q3) - qp2*qrp3*cos(q2 + q3) - qp3*qrp2*cos(q2 + q3) - qp3*qrp3*cos(q2 + q3), qrpp1/2 + (qrpp1*cos(2*q2 + 2*q3))/2 - (qp1*qrp2*sin(2*q2 + 2*q3))/2 - (qp2*qrp1*sin(2*q2 + 2*q3))/2 - (qp1*qrp3*sin(2*q2 + 2*q3))/2 - (qp3*qrp1*sin(2*q2 + 2*q3))/2, qp2*qrp2*sin(q2 + q3) - qrpp3*cos(q2 + q3) - qrpp2*cos(q2 + q3) + qp2*qrp3*sin(q2 + q3) + qp3*qrp2*sin(q2 + q3) + qp3*qrp3*sin(q2 + q3), 0, qrpp1, qrpp1, qrpp1/2 + (qrpp1*cos(2*q2))/2 - (qp1*qrp2*sin(2*q2))/2 - (qp2*qrp1*sin(2*q2))/2, qrpp1, qrpp1/2 + (qrpp1*cos(2*q2))/2 - (qp1*qrp2*sin(2*q2))/2 - (qp2*qrp1*sin(2*q2))/2, qrpp1/2 + (qrpp1*cos(2*q2 + 2*q3))/2 - (qp1*qrp2*sin(2*q2 + 2*q3))/2 - (qp2*qrp1*sin(2*q2 + 2*q3))/2 - (qp1*qrp3*sin(2*q2 + 2*q3))/2 - (qp3*qrp1*sin(2*q2 + 2*q3))/2, -2*qrpp1, - qrpp2*sin(q2) - qp2*qrp2*cos(q2), qrpp2*sin(q2) + qp2*qrp2*cos(q2), -2*qrpp1, - qrpp2*sin(q2 + q3) - qrpp3*sin(q2 + q3) - qp2*qrp2*cos(q2 + q3) - qp2*qrp3*cos(q2 + q3) - qp3*qrp2*cos(q2 + q3) - qp3*qrp3*cos(q2 + q3), 2*qrpp1, qrpp2*sin(q2 + q3) + qrpp3*sin(q2 + q3) + qp2*qrp2*cos(q2 + q3) + qp2*qrp3*cos(q2 + q3) + qp3*qrp2*cos(q2 + q3) + qp3*qrp3*cos(q2 + q3), qrpp2*sin(q2) + qp2*qrp2*cos(q2), qrpp1*cos(q3) + qrpp1*cos(2*q2 + q3) - (qp1*qrp3*sin(q3))/2 - (qp3*qrp1*sin(q3))/2 - qp1*qrp2*sin(2*q2 + q3) - qp2*qrp1*sin(2*q2 + q3) - (qp1*qrp3*sin(2*q2 + q3))/2 - (qp3*qrp1*sin(2*q2 + q3))/2, qrpp2*sin(q2) + qp2*qrp2*cos(q2), qrpp2*sin(q2 + q3) + qrpp3*sin(q2 + q3) + qp2*qrp2*cos(q2 + q3) + qp2*qrp3*cos(q2 + q3) + qp3*qrp2*cos(q2 + q3) + qp3*qrp3*cos(q2 + q3), cos(q1), -cos(q1), -cos(q2)*sin(q1), -cos(q1), -cos(q2)*sin(q1), -cos(q2 + q3)*sin(q1), sin(q1), -sin(q1), cos(q1)*cos(q2), -sin(q1), cos(q1)*cos(q2), cos(q2 + q3)*cos(q1), 0, 0, 0, -cos(q1), qrpp1, -sin(q1); 0, -(qp1*qrp1*sin(2*q2))/2, -qp1*qrp1*cos(2*q2), -qrpp1*sin(q2), (qp1*qrp1*sin(2*q2))/2, -qrpp1*cos(q2), qrpp2, -(qp1*qrp1*sin(2*q2 + 2*q3))/2, -qp1*qrp1*cos(2*q2 + 2*q3), -qrpp1*sin(q2 + q3), (qp1*qrp1*sin(2*q2 + 2*q3))/2, -qrpp1*cos(q2 + q3), qrpp2 + qrpp3, 0, 0, qrpp2 + (qp1*qrp1*sin(2*q2))/2, 0, qrpp2 + (qp1*qrp1*sin(2*q2))/2, qrpp2 + qrpp3 + (qp1*qrp1*sin(2*q2 + 2*q3))/2, 0, -qrpp1*sin(q2), qrpp1*sin(q2), 0, -qrpp1*sin(q2 + q3), 0, qrpp1*sin(q2 + q3), qrpp1*sin(q2), 2*qrpp2*cos(q3) + qrpp3*cos(q3) - qp2*qrp3*sin(q3) - qp3*qrp2*sin(q3) - qp3*qrp3*sin(q3) + qp1*qrp1*sin(2*q2 + q3), qrpp1*sin(q2), qrpp1*sin(q2 + q3), 0, 0, -cos(q1)*sin(q2), 0, -cos(q1)*sin(q2), -sin(q2 + q3)*cos(q1), 0, 0, -sin(q1)*sin(q2), 0, -sin(q1)*sin(q2), -sin(q2 + q3)*sin(q1), -cos(q2), -cos(q2), -cos(q2 + q3), 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, -(qp1*qrp1*sin(2*q2 + 2*q3))/2, -qp1*qrp1*cos(2*q2 + 2*q3), -qrpp1*sin(q2 + q3), (qp1*qrp1*sin(2*q2 + 2*q3))/2, -qrpp1*cos(q2 + q3), qrpp2 + qrpp3, 0, 0, 0, 0, 0, qrpp2 + qrpp3 + (qp1*qrp1*sin(2*q2 + 2*q3))/2, 0, 0, 0, 0, -qrpp1*sin(q2 + q3), 0, qrpp1*sin(q2 + q3), 0, qrpp2*cos(q3) + (qp1*qrp1*sin(q3))/2 + qp2*qrp2*sin(q3) + (qp1*qrp1*sin(2*q2 + q3))/2, 0, qrpp1*sin(q2 + q3), 0, 0, 0, 0, 0, -sin(q2 + q3)*cos(q1), 0, 0, 0, 0, 0, -sin(q2 + q3)*sin(q1), 0, 0, -cos(q2 + q3), 0, 0, 0];
    
    Gamma = 1000*diag([1e-3*ones(13,1); 1e-5*ones(17,1); 1e-3*ones(48-13-17,1)]);
    time_step = str2num(get_param(bdroot,'FixedStep'));
    S = Jv\Sx;
    update = - time_step * Gamma * Yr' * S;
    Theta_hat = Theta_hat + update;
    tauc = -b*Kd * Sx +Yr*Theta_hat;
else
    
    DeltaQ = Q -Qd;
    DeltaQp = Qp - Qdp;
    DeltaQi = [u(58); u(59); u(60)];
    
    %PD
    %Qrp = Qdp - Kp * DeltaQ;
    %PID
    Qrp = Qdp - Kp*DeltaQ -Ki*DeltaQi;
    Sq = Qp - Qrp;
    
    qrp1 = Qrp(1);
    qrp2 = Qrp(2);
    qrp3 = Qrp(3);
    
    Qrpp = [u(61);u(62);u(63)];
    qrpp1 = Qrpp(1);
    qrpp2 = Qrpp(2);
    qrpp3 = Qrpp(3);

    Yr =  [qrpp1, qrpp1/2 - (qrpp1*cos(2*q2))/2 + (qp1*qrp2*sin(2*q2))/2 + (qp2*qrp1*sin(2*q2))/2, qrpp1*sin(2*q2) + qp1*qrp2*cos(2*q2) + qp2*qrp1*cos(2*q2), - qrpp2*sin(q2) - qp2*qrp2*cos(q2), qrpp1/2 + (qrpp1*cos(2*q2))/2 - (qp1*qrp2*sin(2*q2))/2 - (qp2*qrp1*sin(2*q2))/2, qp2*qrp2*sin(q2) - qrpp2*cos(q2), 0, qrpp1/2 - (qrpp1*cos(2*q2 + 2*q3))/2 + (qp1*qrp2*sin(2*q2 + 2*q3))/2 + (qp2*qrp1*sin(2*q2 + 2*q3))/2 + (qp1*qrp3*sin(2*q2 + 2*q3))/2 + (qp3*qrp1*sin(2*q2 + 2*q3))/2, qrpp1*sin(2*q2 + 2*q3) + qp1*qrp2*cos(2*q2 + 2*q3) + qp2*qrp1*cos(2*q2 + 2*q3) + qp1*qrp3*cos(2*q2 + 2*q3) + qp3*qrp1*cos(2*q2 + 2*q3), - qrpp2*sin(q2 + q3) - qrpp3*sin(q2 + q3) - qp2*qrp2*cos(q2 + q3) - qp2*qrp3*cos(q2 + q3) - qp3*qrp2*cos(q2 + q3) - qp3*qrp3*cos(q2 + q3), qrpp1/2 + (qrpp1*cos(2*q2 + 2*q3))/2 - (qp1*qrp2*sin(2*q2 + 2*q3))/2 - (qp2*qrp1*sin(2*q2 + 2*q3))/2 - (qp1*qrp3*sin(2*q2 + 2*q3))/2 - (qp3*qrp1*sin(2*q2 + 2*q3))/2, qp2*qrp2*sin(q2 + q3) - qrpp3*cos(q2 + q3) - qrpp2*cos(q2 + q3) + qp2*qrp3*sin(q2 + q3) + qp3*qrp2*sin(q2 + q3) + qp3*qrp3*sin(q2 + q3), 0, qrpp1, qrpp1, qrpp1/2 + (qrpp1*cos(2*q2))/2 - (qp1*qrp2*sin(2*q2))/2 - (qp2*qrp1*sin(2*q2))/2, qrpp1, qrpp1/2 + (qrpp1*cos(2*q2))/2 - (qp1*qrp2*sin(2*q2))/2 - (qp2*qrp1*sin(2*q2))/2, qrpp1/2 + (qrpp1*cos(2*q2 + 2*q3))/2 - (qp1*qrp2*sin(2*q2 + 2*q3))/2 - (qp2*qrp1*sin(2*q2 + 2*q3))/2 - (qp1*qrp3*sin(2*q2 + 2*q3))/2 - (qp3*qrp1*sin(2*q2 + 2*q3))/2, -2*qrpp1, - qrpp2*sin(q2) - qp2*qrp2*cos(q2), qrpp2*sin(q2) + qp2*qrp2*cos(q2), -2*qrpp1, - qrpp2*sin(q2 + q3) - qrpp3*sin(q2 + q3) - qp2*qrp2*cos(q2 + q3) - qp2*qrp3*cos(q2 + q3) - qp3*qrp2*cos(q2 + q3) - qp3*qrp3*cos(q2 + q3), 2*qrpp1, qrpp2*sin(q2 + q3) + qrpp3*sin(q2 + q3) + qp2*qrp2*cos(q2 + q3) + qp2*qrp3*cos(q2 + q3) + qp3*qrp2*cos(q2 + q3) + qp3*qrp3*cos(q2 + q3), qrpp2*sin(q2) + qp2*qrp2*cos(q2), qrpp1*cos(q3) + qrpp1*cos(2*q2 + q3) - (qp1*qrp3*sin(q3))/2 - (qp3*qrp1*sin(q3))/2 - qp1*qrp2*sin(2*q2 + q3) - qp2*qrp1*sin(2*q2 + q3) - (qp1*qrp3*sin(2*q2 + q3))/2 - (qp3*qrp1*sin(2*q2 + q3))/2, qrpp2*sin(q2) + qp2*qrp2*cos(q2), qrpp2*sin(q2 + q3) + qrpp3*sin(q2 + q3) + qp2*qrp2*cos(q2 + q3) + qp2*qrp3*cos(q2 + q3) + qp3*qrp2*cos(q2 + q3) + qp3*qrp3*cos(q2 + q3), cos(q1), -cos(q1), -cos(q2)*sin(q1), -cos(q1), -cos(q2)*sin(q1), -cos(q2 + q3)*sin(q1), sin(q1), -sin(q1), cos(q1)*cos(q2), -sin(q1), cos(q1)*cos(q2), cos(q2 + q3)*cos(q1), 0, 0, 0, -cos(q1), qrpp1, -sin(q1); 0, -(qp1*qrp1*sin(2*q2))/2, -qp1*qrp1*cos(2*q2), -qrpp1*sin(q2), (qp1*qrp1*sin(2*q2))/2, -qrpp1*cos(q2), qrpp2, -(qp1*qrp1*sin(2*q2 + 2*q3))/2, -qp1*qrp1*cos(2*q2 + 2*q3), -qrpp1*sin(q2 + q3), (qp1*qrp1*sin(2*q2 + 2*q3))/2, -qrpp1*cos(q2 + q3), qrpp2 + qrpp3, 0, 0, qrpp2 + (qp1*qrp1*sin(2*q2))/2, 0, qrpp2 + (qp1*qrp1*sin(2*q2))/2, qrpp2 + qrpp3 + (qp1*qrp1*sin(2*q2 + 2*q3))/2, 0, -qrpp1*sin(q2), qrpp1*sin(q2), 0, -qrpp1*sin(q2 + q3), 0, qrpp1*sin(q2 + q3), qrpp1*sin(q2), 2*qrpp2*cos(q3) + qrpp3*cos(q3) - qp2*qrp3*sin(q3) - qp3*qrp2*sin(q3) - qp3*qrp3*sin(q3) + qp1*qrp1*sin(2*q2 + q3), qrpp1*sin(q2), qrpp1*sin(q2 + q3), 0, 0, -cos(q1)*sin(q2), 0, -cos(q1)*sin(q2), -sin(q2 + q3)*cos(q1), 0, 0, -sin(q1)*sin(q2), 0, -sin(q1)*sin(q2), -sin(q2 + q3)*sin(q1), -cos(q2), -cos(q2), -cos(q2 + q3), 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, -(qp1*qrp1*sin(2*q2 + 2*q3))/2, -qp1*qrp1*cos(2*q2 + 2*q3), -qrpp1*sin(q2 + q3), (qp1*qrp1*sin(2*q2 + 2*q3))/2, -qrpp1*cos(q2 + q3), qrpp2 + qrpp3, 0, 0, 0, 0, 0, qrpp2 + qrpp3 + (qp1*qrp1*sin(2*q2 + 2*q3))/2, 0, 0, 0, 0, -qrpp1*sin(q2 + q3), 0, qrpp1*sin(q2 + q3), 0, qrpp2*cos(q3) + (qp1*qrp1*sin(q3))/2 + qp2*qrp2*sin(q3) + (qp1*qrp1*sin(2*q2 + q3))/2, 0, qrpp1*sin(q2 + q3), 0, 0, 0, 0, 0, -sin(q2 + q3)*cos(q1), 0, 0, 0, 0, 0, -sin(q2 + q3)*sin(q1), 0, 0, -cos(q2 + q3), 0, 0, 0];
    Gamma = 1e-1 * eye(48);
    time_step = str2num(get_param(bdroot,'FixedStep'));
    Theta_hat = Theta_hat - time_step * Gamma * Yr' * Sq;
    tauc = -Kd * Sq +Yr*Theta_hat;
end 
    

if (op) 
    tau=[tauc;DeltaX;DeltaXp;Qrp];
else
    tau=[tauc;DeltaQ;DeltaQp;Qrp];
end



end

function t = ef(Q)
    q1 = Q(1);
    q2 = Q(2);
    q3 = Q(3);
    L = 0.001*[128;163.9;92.2;100;150;-10;612.7;687.3;(612.7)/2.0;(687.3)/2.0];
    L1 = L(1);
    L2 = L(2);
    L4 = L(3);
    L6 = L(4);
    L7 = L(5);
    L9 = L(6);
    L3 = L(7);
    L5 = L(8);
    L8 = L(9);
    L10 = L(10);
    t = [L3*cos(q1)*cos(q2) - sin(q1)*(L2 + L4) + L5*cos(q1)*cos(q2)*cos(q3) - L5*cos(q1)*sin(q2)*sin(q3);
        cos(q1)*(L2 + L4) + L3*cos(q2)*sin(q1) + L5*cos(q2)*cos(q3)*sin(q1) - L5*sin(q1)*sin(q2)*sin(q3); 
        L1 - L3*sin(q2) - L5*cos(q2)*sin(q3) - L5*cos(q3)*sin(q2)];

end


