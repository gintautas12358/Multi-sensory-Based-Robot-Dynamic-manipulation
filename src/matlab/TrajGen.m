function [qd] = TrajGen( u )
%TRAJGEN Summary of this function goes here
%   Detailed explanation goes here

global t0 t1 t2 t3 t4 t5 t6 t7 t8 to_home

t=u(4);


if(t == 0)
    % Initalize global variables
    t0 = 0;
    t1 = 20;
    t2 = 40;
    t3 = 60;
    t4 = 80;
    t5 = 100;
    t6 = 100;
    t7 = 100;
    t8 = 100;
    to_home = false;
end

% compute trajectory
% Regulation

q10 = 0;
q20 = -90;
q30 = 90;

x10 = 0.6873;
x20 = 0.2561;
x30 = 0.7407;

op = false;

if (t<t1 & ~to_home)
    q1d = 0;
    q2d = -90;
    q3d = 90;
    q1dp = 0;
    q2dp = 0;
    q3dp = 0;
    Qd = [q1d;q2d;q3d];
    Qdp = [q1dp;q2dp;q3dp];
    op = false;
    
elseif (t<t2 & ~to_home)
    w = 0.8;
    q1d = 50*sin(w*t)+q10;
    q2d = 20*sin(w*t)+q20;
    q3d = 20*sin(w*t)+q30;
    q1dp = 2*50*cos(w*t)+q10;
    q2dp = 2*20*cos(w*t)+q20;
    q3dp = 2*20*cos(w*t)+q30;
    Qd = [q1d;q2d;q3d];
    Qdp = [q1dp;q2dp;q3dp];
     op = false;
elseif (t<t3 & ~to_home)
    w = 0.5;
    q1d = 50*sin(w*t)+q10;
    q2d = 20*sin(w*t)+q20;
    q3d = 20*sin(w*t)+q30;
    q1dp = 2*50*cos(w*t)+q10;
    q2dp = 2*20*cos(w*t)+q20;
    q3dp = 2*20*cos(w*t)+q30;
    Qd = [q1d;q2d;q3d];
    Qdp = [q1dp;q2dp;q3dp];
     op = false;
    
elseif (t<t4 & ~to_home)
    xd = x10;
    yd = x20;
    zd = x30;
    xdp = 0.0;
    ydp = 0.0;
    zdp = 0.0;
    Xd = [xd;yd;zd];
    Xdp = [xdp;ydp;zdp];
    op = true;
elseif (t<t5 & ~to_home)
    w = 1;
    xd = x10 + 0.1*sin(w*t);
    yd = x20 + 0.1*cos(w*t);
    zd = x30 + 0.05*sin(w*7*t);
    xdp = w*0.1*cos(w*t);
    ydp = -w*0.1*sin(w*t);
    zdp = w*7*0.05*cos(w*7*t);
    Xd = [xd;yd;zd];
    Xdp = [xdp;ydp;zdp];
    op = true;
    
elseif (t <t6 & ~to_home)
    w = 2;
    xd = x10 + 0.1*sin(w*t);
    yd = x20 + 0.1*cos(w*t);
    zd = x30 + 0.05*sin(w*7*t);
    xdp = w*0.1*cos(w*t);
    ydp = -w*0.1*sin(w*t);
    zdp = w*7*0.05*cos(w*7*t);
    Xd = [xd;yd;zd];
    Xdp = [xdp;ydp;zdp];
    op = true;
    
    % to singularity
elseif (t <t7 & ~to_home)
    w = 2;
    xd = 1.5 + 0.1*sin(w*t);
    yd = 0.2 + 0.1*cos(w*t);
    zd = 0.2 + 0.05*sin(w*7*t);
    xdp = w*0.1*cos(w*t);
    ydp = -w*0.1*sin(w*t);
    zdp = w*7*0.05*cos(w*7*t);
    Xd = [xd;yd;zd];
    Xdp = [xdp;ydp;zdp];
    op = true;
    
    % homing
elseif (to_home)
    q1d = 0;
    q2d = -90;
    q3d = 0;
    q1dp = 0;
    q2dp = 0;
    q3dp = 0;
    Qd = [q1d;q2d;q3d];
    Qdp = [q1dp;q2dp;q3dp];
    op = false;
end


if (op)
    qd=[Xd;Xdp;op];
else    
    qd=[Qd;Qdp;op];
end

end


