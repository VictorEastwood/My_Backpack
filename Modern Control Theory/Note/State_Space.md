# 状态空间

---

## 1.定义
状态空间方程:
$$
\begin{aligned}
\dot{z} = Az + Bu\\
y = Cz + Du
\end{aligned}
$$

---

## 2.建模过程
假设有一个系统的微分方程为
$$
\begin{aligned}
m\ddot{x} + B\dot{x} + kx = f(t)
\end{aligned}
$$
选择状态变量消除高阶项
state 1: $z_1 = x$
state 2: $z_2 = \dot{x}$
可得：
$$
\begin{aligned}
\dot{z_1} &= z_2\\
\dot{z_2} &= -\frac{k}{m}z_1 - \frac{B}{m}z_2 + \frac{1}{m}u(t)
\end{aligned}
$$
写成矩阵形式

$$
\begin{aligned}
\begin{bmatrix}
\dot{z_1}\\
\dot{z_2}
\end{bmatrix}&=
\begin{bmatrix}
0 & 1\\
-\frac{k}{m} & -\frac{B}{m}
\end{bmatrix}
\begin{bmatrix}
z_1\\
z_2
\end{bmatrix}+
\begin{bmatrix}
0\\
\frac{1}{m}
\end{bmatrix}
u(t)\\
y &= \begin{bmatrix}
1 & 0
\end{bmatrix}
\begin{bmatrix}
z_1\\
z_2
\end{bmatrix}+
\begin{bmatrix}
0
\end{bmatrix}
u(t)
\end{aligned}
$$
其中
$$
\begin{aligned}
A &= \begin{bmatrix}
0 & 1\\
-\frac{k}{m} & -\frac{B}{m}
\end{bmatrix}\\
B &= \begin{bmatrix}
0\\
\frac{1}{m}
\end{bmatrix}\\
C &= \begin{bmatrix}
1 & 0
\end{bmatrix}\\
D &= \begin{bmatrix}
0
\end{bmatrix}
\end{aligned}
$$

---

## 3. 状态空间和传递函数的转换

其中$G(s)$是传递函数
$$
\begin{aligned}
G(s) = \frac{X(s)}{U(s)} = \frac{Y(s)}{U(s)} = \frac{1}{ms^2+Bs+k}
\end{aligned}
$$
推导：
$$
\begin{aligned}
\mathcal{L}\dot{z} &= \mathcal{L}Az + \mathcal{L}Bu\\
sZ(s) &= AZ(s) + BU(s)\\
Z(s) &= (sI-A)^{-1}BU(s)\\
Y(s) &= CZ(s) + DU(s)\\
&= C(sI-A)^{-1}BU(s) + DU(s)\\
\end{aligned}
$$
故
$$
\begin{aligned}
G(s) = \frac{Y(s)}{U(s)} = C(sI-A)^{-1}B + D
\end{aligned}
$$
根据上面的例子，可以得到
$$
\begin{aligned}
SI-A &= \begin{bmatrix}
s & 0\\
0 & s
\end{bmatrix} - \begin{bmatrix}
0 & 1\\
-\frac{k}{m} & -\frac{B}{m}
\end{bmatrix}\\
&= \begin{bmatrix}
s & -1\\
\frac{k}{m} & s+\frac{B}{m}
\end{bmatrix}\\
(SI-A)^{-1} &= \frac{(SI-A)^*}{|SI-A|}\\
&= \frac{1}{s(s+\frac{B}{m})+\frac{k}{m}}\begin{bmatrix}
s+\frac{B}{m} & 1\\
-\frac{k}{m} & s
\end{bmatrix}
\end{aligned}
$$
故：
$$
\begin{aligned}
G(s) &= C(sI-A)^{-1}B + D\\
&= \frac{\frac{1}{m}}{s^2+\frac{B}{m}s+\frac{k}{m}}\\
&= \frac{1}{ms^2+Bs+k}
\end{aligned}
$$
可以看出，状态空间和传递函数是等价的。
思路：
令
$$
\begin{aligned}
|SI-A| &= 0\\
\end{aligned}
$$
S是A的特征值
又
$$
\begin{aligned}
ms^2+Bs+k &= 0\\
\end{aligned}
$$
s是传递函数的极点且决定系统的稳定性

---

## 4.状态空间方程的解_矩阵指数函数(解耦)

$$
\begin{aligned}
A  = P\Lambda P^{-1}
\end{aligned}
$$
其中$\Lambda$是对角矩阵，对角元素是特征值
$$
\begin{aligned}
\Lambda
= \begin{bmatrix}
\lambda_1 & 0 & \cdots & 0\\
0 & \lambda_2 & \cdots & 0\\
\vdots & \vdots & \ddots & \vdots\\
0 & 0 & \cdots & \lambda_n
\end{bmatrix}
\end{aligned}
$$
P是过渡矩阵其列向量是特征向量
$$
\begin{aligned}
P = \begin{bmatrix}
v_1 & v_2 & \cdots & v_n
\end{bmatrix}
\end{aligned}
$$
故
$$
\begin{aligned}
e^{At} &= I + At + \frac{A^2t^2}{2!} +\frac{A^3t^3}{3!} + \cdots\\
P^{-1}e^{At}P &= P^{-1}IP + P^{-1}AtP + P^{-1}\frac{A^2t^2}{2!}P + P^{-1}\frac{A^3t^3}{3!}P + \cdots\\
&= I + \Lambda t + \frac{\Lambda^2t^2}{2!} + \frac{\Lambda^3t^3}{3!} + \cdots\\
&= \begin{bmatrix}
e^{\lambda_1t} & 0 & \cdots & 0\\
0 & e^{\lambda_2t} & \cdots & 0\\
\vdots & \vdots & \ddots & \vdots\\
0 & 0 & \cdots & e^{\lambda_nt}
\end{bmatrix}= e^{\Lambda t}
\end{aligned}
$$

---
## 5.状态空间方程和传递函数的转换
推导过程：
$$
\begin{aligned}
% x表示成向量的形式,上面是箭头：
\frac{\vec{x}(t)}{dt} = A\vec{x}(t) + B\vec{u}(t)\\
e^{-At}\frac{\vec{x}(t)}{dt} - e^{-At}A\vec{x}(t) = e^{-At}B\vec{u}(t)\\
\frac{d}{dt}(e^{-At}\vec{x}(t)) = e^{-At}B\vec{u}(t)\\
\int_{t_0}^{t} \frac{d}{dt}(e^{-At}\vec{x}(t))dt = \int_{t_0}^{t} e^{-At}B\vec{u}(t)dt\\
e^{-At}\vec{x}(t)  = e^{-At_0}\vec{x}(t_0) + \int_{t_0}^{t} e^{-A\tau}B\vec{u}(\tau)d\tau\\
\vec{x}(t) = e^{A(t-t_0)}\vec{x}(t_0) + \int_{t_0}^{t} e^{A(t-\tau)}B\vec{u}(\tau)d\tau
\end{aligned}
$$
其中A的特征值决定这一项随时间的变化。如果A的特征值是负的，那么这一项会随时间衰减，如果是正的，那么这一项会随时间增长。这一项的物理意义是系统的状态在没有外部输入的情况下的变化。
上式也可以写成状态转移矩阵的形式：
$$
\begin{aligned}
\vec{x}(t) = \Phi(t-t_0)\vec{x}(t_0) + \int_{t_0}^{t} \Phi(t-\tau)B\vec{u}(\tau)d\tau
\end{aligned}
$$

---