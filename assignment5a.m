f = @(x) sin(x);
x = 1;
h = 10.^(-4:0.1:0);                 % För assignment5 a
%h = 10.^(-15:0.1:0);                % För assignment5 b
df = (f(x+h) - f(x))./h;            % Derivatan med framåtdifferens
dfc = (f(x+h) - f(x-h))./(2*h);     % Derivatan med centraldifferens

df_true = cos(1);

% Plotta felapproximationen för framåtdifferesen
figure(1)
loglog(h, abs(df_true - df))
title('Log av framåtdifferensen av f(x)')
xlabel('h')
ylabel('E_h')

% Plotta felapproximationen för centraldifferesen
figure(2)
loglog(h, abs(df_true - dfc))
title('Log av centraldifferensen av f(x)')
xlabel('h')
ylabel('E_hc')