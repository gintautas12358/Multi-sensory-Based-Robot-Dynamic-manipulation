function [ Xout ] = SimpleRobotPlotROS( u )
%SIMPLEROBOTPLOT Summary of this function goes here
persistent  jointpub jointmsg counter tftree tfStampedMsg tfStampedMsg1 tfStampedMsg2 tfStampedMsg3
persistent  tfStampedMsg4 tfStampedMsg5 tfStampedMsg6

%Joint Position
q1=deg2rad(u(1));
q2=deg2rad(u(2));
q3=deg2rad(u(3));
q4=deg2rad(u(4));
q5=deg2rad(u(5));
q6=deg2rad(u(6));

%Joint Velocityq3d1
qp1=u(7);
qp2=u(8);
qp3=u(9);
qp4=u(10);
qp5=u(11);
qp6=u(12);

%Kinematic Parameters
L1=u(13);
L2=u(14);
L4=u(15);
L6=u(16);
L7=u(17);
L9=u(18);
L3=u(19);
L5=u(20);
L8=u(21);
L10=u(22);
L11=u(23);
L12=u(24);


%Time
t=u(25);

% %Desired joint position
% qd = [u(49);u(50);u(51)];
% 
% %Desired joint velocity
% qdp = [u(52);u(53);u(54)];

%Joint Position Vector
Q=[q1 q2 q3 q4 q5 q6];

%Joint Velocity Vector
Qp=[qp1 qp2 qp3 qp4 qp5 qp6];

% Robot Base
T0_W = [1 0 0 0;
        0 1 0 0;
        0 0 1 L1;
        0 0 0 1];

% Homogeneous Transformations

T1_0=[cos(q1), 0, -sin(q1), 0; sin(q1), 0, cos(q1), 0; 0, -1, 0, 0; 0, 0, 0, 1];

T2_1=[cos(q2 - pi/2), -sin(q2 - pi/2), 0, L3*cos(q2 - pi/2); sin(q2 - pi/2), cos(q2 - pi/2), 0, L3*sin(q2 - pi/2); 0, 0, 1, 0; 0, 0, 0, 1];

T3_2=[cos(q3), -sin(q3), 0, L11*cos(q3); sin(q3), cos(q3), 0, L11*sin(q3); 0, 0, 1, L2; 0, 0, 0, 1];

T4_3=[cos(q4 + pi/2), 0, sin(q4 + pi/2), 0; sin(q4 + pi/2), 0, -cos(q4 + pi/2), 0; 0, 1, 0, 0; 0, 0, 0, 1];

T5_4=[cos(q5), 0, -sin(q5), 0; sin(q5), 0, cos(q5), 0; 0, -1, 0, L12; 0, 0, 0, 1];

T6_5=[cos(q6), -sin(q6), 0, 0; sin(q6), cos(q6), 0, 0; 0, 0, 1, L4; 0, 0, 0, 1];


T2_0 = T1_0 * T2_1;
T3_0 = T2_0 * T3_2;
T4_0 = T3_0 * T4_3;
T5_0 = T4_0 * T5_4;
T6_0 = T5_0 * T6_5;


T1_W = T0_W * T1_0;
T2_W = T0_W * T2_0;
T3_W = T0_W * T3_0;
T4_W = T0_W * T4_0;
T5_W = T0_W * T5_0;
T6_W = T0_W * T6_0;

pef = T6_W(1:3,4);
[ phi_d,theta_d,psi_d ] = R2EulerA(T6_W(1:3,1:3));
oef = [ phi_d; theta_d; psi_d ];

Xef_W=[pef; oef];


if t==0
    
    %% TF publisher
    tftree = rostf;
    tfStampedMsg = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg.Header.FrameId = 'world';
    tfStampedMsg.ChildFrameId = 'DH_0';
    
    tfStampedMsg1 = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg1.Header.FrameId = 'world';
    tfStampedMsg1.ChildFrameId = 'DH_1';
    
    tfStampedMsg2 = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg2.Header.FrameId = 'world';
    tfStampedMsg2.ChildFrameId = 'DH_2';
    
    tfStampedMsg3 = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg3.Header.FrameId = 'world';
    tfStampedMsg3.ChildFrameId = 'DH_3';

    tfStampedMsg4 = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg4.Header.FrameId = 'world';
    tfStampedMsg4.ChildFrameId = 'DH_4';

    tfStampedMsg5 = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg5.Header.FrameId = 'world';
    tfStampedMsg5.ChildFrameId = 'DH_5';

    tfStampedMsg6 = rosmessage('geometry_msgs/TransformStamped');
    tfStampedMsg6.Header.FrameId = 'world';
    tfStampedMsg6.ChildFrameId = 'DH_6';

    
    %% Joint State Publisher
    %Use here the correct topic name --see bringup launch file--
    jointpub = rospublisher('/ursa_joint_states', 'sensor_msgs/JointState');
    jointmsg = rosmessage(jointpub);
    
    % specific names of the joints --see urdf file--
    jointmsg.Name={ 'ursa_shoulder_pan_joint', 'ursa_shoulder_lift_joint', 'ursa_elbow_joint', 'ursa_wrist_1_joint', 'ursa_wrist_2_joint', 'ursa_wrist_3_joint'};
    
    for i=1:6
        jointmsg.Velocity(i)=0.0;
        jointmsg.Effort(i)=0.0;
    end
    
    counter=0;
    
end

%% JOINT STATE MSG and TF MSG
sampleTime=0.06;
offsets = [0; 0; 0];
if(~mod(t,sampleTime))
    rT=rostime('now');
    jointmsg.Header.Stamp=rT;
    jointmsg.Header.Seq=counter;
    jointmsg.Position=Q+offsets;
    send(jointpub,jointmsg);
    
    
    getTF(tfStampedMsg, T0_W, counter, rT);
    getTF(tfStampedMsg1, T1_W, counter, rT);
    getTF(tfStampedMsg2, T2_W, counter, rT);
    getTF(tfStampedMsg3, T3_W, counter, rT);
    getTF(tfStampedMsg4, T4_W, counter, rT);
    getTF(tfStampedMsg5, T5_W, counter, rT);
    getTF(tfStampedMsg6, T6_W, counter, rT);
    
    arrayTFs=[tfStampedMsg;
        tfStampedMsg1;
        tfStampedMsg2;
        tfStampedMsg3;
        tfStampedMsg4;
        tfStampedMsg5;
        tfStampedMsg6];
    
    
    counter=counter+1;
    
    sendTransform(tftree, arrayTFs);
end

%%

Xout=[Xef_W(1:3)];




end

