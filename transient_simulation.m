clear; close all; clc;

L = 2e-3; %m (2mm)
x = linspace(0/L,L/L,30);
burntime = 1.89; %[s] OpenMotorの結果より
t = linspace(0,burntime,30);
m = 0;
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t);

plot(t,sol(:,1)-273);

title('Chamber wall temperature increase');
xlabel('Time [sec]');
ylabel('Wall temperature [C]');
big;
grid;

function [c,f,s] = heatpde(x,t,u,dudx)
rho = 2810; %kg/m3: 2.81g/cm3
lambda = 140; %アルミニウムA7075の熱伝導率 130-150
c_specific_heat = 714.8; %714.8 J/kg*K
a = lambda/(c_specific_heat*rho);
c = 1/a;
f = dudx;
s = 0;
end

function u0 = heatic(x)
T0 = 300; %[K]
u0 = T0;
end

function [pl,ql,pr,qr] = heatbc(xl,ul,xr,ur,t)
lambda = 140; %アルミニウムA7075の熱伝導率 130-150
% グレイン全重量に対する全エンタルピー(kcal/system mass)
% Propep 3の計算結果より
H = 1012.26; % [kcal]
% 全生成熱（燃焼熱）
h = 4.184 * H; %kJ
%全燃焼時間
burntime = 1.89; %[s] OpenMotorの結果より
%時間平均燃焼熱
h_ave = h/burntime; %kJ/s=kW
%燃焼器の内部表面積
D = 50e-3; %m 
A = pi/4*D^2; %m2
height = 200e-3; %m;
S = pi*D*height;
total_area = S+2*A;
%面積あたりの平均熱流束
q = h_ave / total_area; %kW/m2
q = 1000*q; %W/m2

pl = q;
ql = lambda;
pr = 0;
qr = lambda;
end

