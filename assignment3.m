clear all, close all, clc
x = 1;
y = 2;
% 
dfx = abs(2.*y.*x.*exp(y.*x.^2));
dfy = abs(x.^2.*exp(y.*x.^2));
Ex = 0.01;
Ey = 0.05;
% 
Ef = dfx * Ex + dfy * Ey
% 
% 
% % Plottar funktionen f
% [X,Y] = meshgrid(-4.5:.2:0); 
% f = exp(Y.*(X.^2));
% 
% figure(1)
% surf(X, Y, f)

Funcy=exp(y*(x.^2));

yexp1=exp((y+Ey)*x.^2);
yexp2=exp(y*(x+Ex).^2);

Expst=abs(Funcy-yexp1)+abs(Funcy-yexp2)
