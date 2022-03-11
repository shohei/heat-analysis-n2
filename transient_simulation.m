clear; close all; clc;

L = 2e-3; %m (2mm)
x = linspace(0/L,L/L,100);
t = [0.01 0.02 0.05 0.10 0.20];
m = 0;
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t);

plot(sol(1,:));
hold on;
plot(sol(2,:));
plot(sol(3,:));
plot(sol(4,:));
plot(sol(5,:));
legend(string(t));
title('平板の非定常熱伝導');
xlabel('x/L');
ylabel('T/T0');
big;
grid;

function [c,f,s] = heatpde(x,t,u,dudx)
a = 1;
c = 1/a;
f = dudx;
s = 0;
end

function u0 = heatic(x)
T0 = 1;
u0 = T0;
end

function [pl,ql,pr,qr] = heatbc(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = ur;
qr = 0;
end









