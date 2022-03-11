clear; close all; clc;

L = 1;
x = linspace(0/L,L/L,100);
t = [0.01 0.02 0.05 0.10 0.20 100];
m = 0;
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t);

plot(x,sol(1,:));
hold on;
plot(x,sol(2,:));
plot(x,sol(3,:));
plot(x,sol(4,:));
plot(x,sol(5,:));
plot(x,sol(6,:));
legend(string(t));
title('半無限物体の非定常熱伝導：片側をいきなり冷却');
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
pr = ur-1;
qr = 0;
end




