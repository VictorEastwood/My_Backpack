clear;
clc;

%% 定义倒立摆物理性质
M = 2; % 滑块质量
m = 0.1; % 摆杆质量
l = 0.5; % 摆杆长度的一半
g = 9.81; % 重力加速度

%% 状态空间矩阵
A = [0 0 1 0;
    0 0 0 1;
    0 -3*m*g/(4*M+m) 0 0;
    0 3*(M+m)*g/((4*M+m)*l) 0 0];
B = [0;0;4/(4*M+m);-3/((4*M+m)*l)];

%% 求LQR增益矩阵
Q = diag([90 90 10 10]); % x q dx dq
R = 1; % fx
K = lqr(A,B,Q,R);
disp('K = ');
disp(K);