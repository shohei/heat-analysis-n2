clear; close all; clc;

L = 2e-3; %[m]. 2mm
Tin = 1000; %K
Tinf = 300; %K
alpha_in = 1000;% 燃焼ガスの熱伝達係数 by Nakka
% https://www.nakka-rocketry.net/therm.html#:~:text=Burn%20time%20of%201.5%20seconds,1000%20Watt%2Fm2%2DK
alpha_out = 4.67; %空気の熱伝達係数（静止空気）
lambda = 140; %アルミニウムA7075の熱伝導率 130-150
% lambda = 210; %アルミニウムA6063の熱伝導率 201-218
den = 1/alpha_in + L/lambda + 1/alpha_out;
K = 1/den;
q = K*(Tin-Tinf);
T1 = Tin-q/alpha_in;
T2 = Tinf+q/alpha_out;
fprintf('燃焼室内壁面温度 T1: %.2f[℃]\n',T1-273);
fprintf('燃焼室外壁面温度 T2: %.2f[℃]\n',T2-273);








