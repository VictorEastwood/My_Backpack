## Simscape

- 在需要旋转，平移的位置设置坐标
- 所有的旋转关节转轴都是绕着 Z 轴的，滑动关节都是沿着 Z 轴的
- 因此要对坐标进行旋转平移(即 Rigid Transform 坐标变换)
- 或者在模型上设置一个以自身为基准的坐标系

## 坐标旋转问题：

- 靠近世界坐标系的坐标不动，另一侧做旋转运动
- 以某个轴不动，旋转角度为正值，则 F 坐标相对于 B 坐标做逆时针运动，(B 坐标相对于 F 坐标做顺时针运动)
- 假设某个坐标(B 坐标) X 垂直屏幕向外，Y 水平向右，Z 竖直向上
- 以+Y 为基准旋转 90 度，则
- 旋转后的坐标(F 坐标) X 竖直向下，Y 水平向右，Z 垂直屏幕向外
- 6-DOF Joint 不同于 Cartesian Joint 不会发生万向节锁定，会绕着任意轴而非 X，Y，Z 轴转动，可通过四元数获取 Yaw，Pitch，Roll
- 力矩给值为正，转动关节绕 Z 轴逆时针方向旋转

## 坐标平移问题：

- 以模型自身的坐标沿基准轴方向移动
- 其中 Simscape 自建的模型坐标在中间，SW 建的模型坐标在基准面
- Standard Axis(标准轴)，在一个轴的方向上平移，输入 1 个参数
- Cartesian(笛卡尔坐标系 xyz)，在坐标系内平移，输入 3 个参数

## 符号含义

- fx(force x)：x 方向水平推力，用于扰动
- px(position x)：x 方向位移
- vx(velocity x)：x 方向速度
- Q(quaternion)：四元数，需要解算为 Yaw，Pitch，Roll，绕 X 轴旋转的为 Roll，绕 Y 轴旋转的为 Pitch，绕 Z 轴旋转的为 Yaw
- wy(omega y)：Pitch轴的角速度
- wz(omega z)：Yaw轴的角速度

## 文件

- Quat_To_Pitch.m与Quat_To_Yaw.m都是将四元数转为对应的姿态角
- Get_LQR_K.m获取K值
- Balanced_Robot_model.slx仿真文件

若要修改K值在下图的红框内修改
![](img\1.jpg)
![](img\2.jpg)
![](img\3.jpg)