# 自动控制原理随堂笔记

## 1.单位阶跃响应

## 2.详细数学推导$G(j\omega)$滤波器的频率响应

假设输入函数为：
$$ 
\begin{aligned}
M_isin(\omega t+\phi_c)
\end{aligned}
$$
其中：
$
\begin{aligned}
M_i : & \text{输入信号的幅度} \\
\omega : & \text{输入信号的频率} \\
\phi_c : & \text{输入信号的相位}
\end{aligned}
$

相应的输出函数为：
$$
\begin{aligned}
M_o sin(\omega t+\phi_o)
\end{aligned}
$$
其中：
$
\begin{aligned}
M_o : & \text{输出信号的幅度} \\
\phi_o : & \text{输出信号的相位}
\end{aligned}
$

则有：
$$
\begin{aligned}
M_o = |G(j\omega)|M_i \\
\phi_o = \angle G(j\omega) + \phi_c
\end{aligned}
$$
