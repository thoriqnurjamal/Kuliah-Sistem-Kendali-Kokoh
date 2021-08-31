pkg load control
tic
J = 0.001;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
Kp = 2;
Ki = 1;
Kd = 1;
s = tf('s');
motor_model = K/((J*s+b)*(L*s+R)+K^2);
controller = Kp + Ki/s + Kd*s;
system = feedback (controller*motor_model,1);
[y,t] = step(system, [0:1:200]);
plot(t,y)
title('Responsi Motor DC dengan Kontrol PID')
ExecuteTime = toc