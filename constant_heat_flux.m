clear; clc; close all;

L = 2e-3; %m
lambda = 140; %アルミニウムA7075の熱伝導率 130-150
alpha_in = 1000;% 燃焼ガスの熱伝達係数 by Nakka
% https://www.nakka-rocketry.net/therm.html#:~:text=Burn%20time%20of%201.5%20seconds,1000%20Watt%2Fm2%2DK
alpha_out = 4.67; %空気の熱伝達係数
Tinf = 300; %[K]

% エンタルピー(kcal/system mass)
% Propep 3の計算結果より
H = 1012.26; % [kcal/system mass]
system_mass = 670.2*1e-3; %kg
% 全生成熱（燃焼熱）
h = H*system_mass; %kcal
h = 4.184 * h; %kJ
%全燃焼時間
burntime = 1.89; %[s] OpenMotorの結果より
%時間平均燃焼熱
h_ave = h/burntime; %kJ/s=kW
%燃焼器の内部表面積
D = 50e-3; %m 
A = pi/4*D^2; %m2
height = 200e-3; %m;
S = pi*D*L;
total_area = S+2*A;
%面積あたりの平均熱流束
q = h_ave / total_area; %kW/m2
q = 1000*q; %W/m2

T2 = Tinf+q/alpha_out;
T1 = T2+q*L/lambda;
fprintf('燃焼室内壁面温度 T1: %.2f[℃]\n',T1-273);
fprintf('燃焼室外壁面温度 T2: %.2f[℃]\n',T2-273);
