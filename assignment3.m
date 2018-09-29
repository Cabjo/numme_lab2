clear all, close all, clc
x = 1;
y = 2;

dfx = abs(2.*y.*x.*exp(y.*x.^2));
dfy = abs(x.^2.*exp(y.*x.^2));
Ex = 0.01;
Ey = 0.05;

Ef = dfx * Ex + dfy * Ey

f=exp(y*(x.^2));

f_exp1=exp((y+Ey)*x.^2);     % y + det absoluta felet av y
f_exp2=exp(y*(x+Ex).^2);     % x + det absoluta felet av x

Ef_exp=abs(f-f_exp1)+abs(f-f_exp2)
