function H = relativeTrans(dh)
    %Hz = [RotZ(dh(1)) [0 0 dh(2)]'; 0 0 0 1];
    %Hx = [RotX(dh(4)) [dh(3) 0 0]'; 0 0 0 1];
    %H = Hz*Hx;
    
    HRz = [RotZ(dh(1)) [0 0 0]'; 0 0 0 1];
    HTz = [eye(3) [0 0 dh(2)]'; 0 0 0 1];
    HRx = [RotX(dh(4)) [0 0 0]'; 0 0 0 1];
    HTx = [eye(3) [dh(3) 0 0]'; 0 0 0 1];
    
    H = HRz * HTz * HTx * HRx;
end