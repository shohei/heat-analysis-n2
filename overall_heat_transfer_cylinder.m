clear; close all; clc;

D = 48e-3; %[m]. 48mm
L = 100e-3; %[m]. 100mm
A = pi*D^2/4*L;
Tin = 1000; %K
Tinf = 300; %K
alpha_in = 2;% 適当
alpha_out = 20; %空気
lambda = 140; %アルミニウムA7075の熱伝導率 130-150
den = 1/alpha_in + L/lambda + 1/alpha_out;
K = 1/den;
Q = K*A*(Tin-Tinf);
q = K*(Tin-Tinf);
T1 = Tin-q/alpha_in;
T2 = Tinf+q/alpha_out;
fprintf('燃焼室内壁面温度 T1: %.2f[℃]\n',T1-273);
fprintf('燃焼室外壁面温度 T2: %.2f[℃]\n',T2-273);

