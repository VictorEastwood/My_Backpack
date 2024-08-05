# 工程数学基础复习笔记

## 1. 卷积的拉普拉斯变换公式推导证明

定理：
$$
\begin{aligned}
\mathcal{L}\{f(t) * g(t)\} = \mathcal{L}\{f(t)\} \mathcal{L}\{g(t)\}
\end{aligned}
$$
证明：
$$
\begin{aligned}
\mathcal{L}\{f(t) * g(t)\} &= \int_0^{\infty} e^{-st} \int_0^t f(\tau)g(t-\tau) d\tau dt \\
&= \int_0^{\infty} \int_0^t e^{-st} f(\tau)g(t-\tau) d\tau dt \\
&= \int_0^{\infty} \int_{\tau}^{\infty} e^{-st} f(\tau)g(t-\tau) dt d\tau \\
&= \int_0^{\infty} f(\tau) e^{-s\tau} \int_{\tau}^{\infty} g(t-\tau) e^{-s(t-\tau)} dt d\tau \\
&= \int_0^{\infty} f(\tau) e^{-s\tau} \int_0^{\infty} g(t) e^{-st} dt d\tau \\
&= \int_0^{\infty} f(\tau) e^{-s\tau} \mathcal{L}\{g(t)\} d\tau \\
&= \mathcal{L}\{f(t)\} \mathcal{L}\{g(t)\}
\end{aligned}
$$
关键步骤解析：
1. 先对卷积公式进行拉普拉斯变换，得到一个二重积分。
2. 交换积分次序。
3. 进行换元操作

## 2. 欧拉公式证明

定理：
$$
\begin{aligned}
e^{j\theta} = \cos(\theta) + j\sin(\theta)
\end{aligned}
$$

证明：
法一：
$$
\begin{aligned}
e^{j\theta} &= \sum_{n=0}^{\infty} \frac{(j\theta)^n}{n!} \\
&= \sum_{n=0}^{\infty} \frac{j^n \theta^n}{n!} \\
&= \sum_{n=0}^{\infty} \frac{j^{2n} \theta^{2n}}{(2n)!} + \sum_{n=0}^{\infty} \frac{j^{2n+1} \theta^{2n+1}}{(2n+1)!} \\
&= \sum_{n=0}^{\infty} \frac{(-1)^n \theta^{2n}}{(2n)!} + j\sum_{n=0}^{\infty} \frac{(-1)^n \theta^{2n+1}}{(2n+1)!} \\
&= \cos(\theta) + j\sin(\theta)
\end{aligned}
$$
法二：
$$
\begin{aligned}
f(\theta) &= \frac{e^{i\theta}}{cos(\theta) + i\sin(\theta)}
\end{aligned}
$$
对$f(\theta)$求导：
$$
\begin{aligned}
f'(\theta) &= \frac{ie^{i\theta}(\cos(\theta) + i\sin(\theta)) - e^{i\theta}(-\sin(\theta) + i\cos(\theta))}{\cos^2(\theta) + \sin^2(\theta)} \\
&= 0
\end{aligned}
$$
所以$f(\theta)$是一个常数，又因为$f(0) = 1$，所以$f(\theta) = 1$，即
$$
\begin{aligned}
e^{i\theta} = \cos(\theta) + i\sin(\theta)
\end{aligned}
$$

## 3. 拉普拉斯变换的性质

### 3.1 线性性质

定理：
$$
\begin{aligned}
\mathcal{L}\{af(t) + bg(t)\} = a\mathcal{L}\{f(t)\} + b\mathcal{L}\{g(t)\}
\end{aligned}
$$

### 3.2 积分性质

定理：
$$
\begin{aligned}
\mathcal{L}\{\int_0^t f(\tau) d\tau\} = \frac{1}{s}\mathcal{L}\{f(t)\}
\end{aligned}
$$

### 3.3 时移性质

定理：
$$
\begin{aligned}
\mathcal{L}\{f(t-t_0)\} = e^{-st_0}\mathcal{L}\{f(t)\}
\end{aligned}
$$

### 3.4 初值定理

定理：
$$
\begin{aligned}
\lim_{s\to\infty} sF(s) = f(0)
\end{aligned}
$$

### 3.5 终值定理

定理：
$$
\begin{aligned}
\lim_{s\to0} sF(s) = f(\infty)
\end{aligned}
$$

### 3.6 拉普拉斯变换的逆变换

定理：
$$
\begin{aligned}
f(t) = \frac{1}{2\pi j} \int_{\sigma-j\infty}^{\sigma+j\infty} F(s) e^{st} ds
\end{aligned}
$$
其中$\sigma$是一个大于所有极点实部的实数。


### 3.7 拉普拉斯变换的收敛性

定理：
$$
\begin{aligned}
\lim_{t\to\infty} f(t) = 0
\end{aligned}
$$

### 3.8 拉普拉斯变换的微分性质

定理：

$$
\begin{aligned}
\mathcal{L}\{f'(t)\} = sF(s) - f(0)
\end{aligned}
$$

### 3.9 拉普拉斯变换的卷积性质

定理：

$$
\begin{aligned}
\mathcal{L}\{f(t) * g(t)\} = F(s)G(s)
\end{aligned}
$$

### 3.10 拉普拉斯变换的乘积性质

定理：

$$
\begin{aligned}
\mathcal{L}\{f(t)g(t)\} = \frac{1}{2\pi j} \int_{\sigma-j\infty}^{\sigma+j\infty} F(\tau)G(s-\tau) d\tau
\end{aligned}
$$

### 3.11 拉普拉斯变换的导数性质

定理：

$$
\begin{aligned}
\mathcal{L}\{t^n f(t)\} = (-1)^n \frac{d^n F(s)}{ds^n}
\end{aligned}
$$

### 3.12 常见函数的拉普拉斯变换

$$
\begin{aligned}
\mathcal{L}\{1\} &= \frac{1}{s} \\
\mathcal{L}\{t^n\} &= \frac{n!}{s^{n+1}} \\
\mathcal{L}\{e^{at}\} &= \frac{1}{s-a} \\
\mathcal{L}\{t^n e^{at}\} &= \frac{n!}{(s-a)^{n+1}} \\
\mathcal{L}\{\sin(\omega t)\} &= \frac{\omega}{s^2 + \omega^2} \\
\mathcal{L}\{\cos(\omega t)\} &= \frac{s}{s^2 + \omega^2} \\
\mathcal{L}\{t^n \sin(\omega t)\} &= \frac{n!\omega}{(s^2 + \omega^2)^{n+1}} \\
\mathcal{L}\{t^n \cos(\omega t)\} &= \frac{n!s}{(s^2 + \omega^2)^{n+1}} \\
\end{aligned}
$$

### 3.13 常见的拉普拉斯逆变换

$$
\begin{aligned}
\mathcal{L}^{-1}\{\frac{1}{s}\} &= 1 \\
\mathcal{L}^{-1}\{\frac{1}{s-a}\} &= e^{at} \\
\mathcal{L}^{-1}\{\frac{1}{(s-a)^n}\} &= \frac{t^{n-1}e^{at}}{(n-1)!} \\
\mathcal{L}^{-1}\{\frac{1}{s^2 + \omega^2}\} &= \frac{\sin(\omega t)}{\omega} \\
\mathcal{L}^{-1}\{\frac{s}{s^2 + \omega^2}\} &= \cos(\omega t) \\
\end{aligned}
$$

## 4. 拉普拉斯变换的定义

定义：
$$
\begin{aligned}
F(s) = \mathcal{L}\{f(t)\} = \int_0^{\infty} e^{-st} f(t) dt
\end{aligned}
$$

## 拉普拉斯逆变换的定义
定义：
$$
\begin{aligned}
f(t) = \mathcal{L}^{-1}\{F(s)\} = \frac{1}{2\pi j} \int_{\sigma-j\infty}^{\sigma+j\infty} F(s) e^{st} ds
\end{aligned}
$$ 


