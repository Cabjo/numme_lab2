clear all, close all, clc
x_true = 3.161826486551946;

x_newton = 2.80000000000000;                 % startgissning för newtons
f = @(x_newton) x_newton - 4*sin(2*x_newton) - 3;   % The function
fp = @(x_newton) 1 - 8*cos(2*x_newton);             % The derivativ
x_newton_i = x_newton - f(x_newton)/fp(x_newton);   % Calculation of x_1 (Newton)

x_fix = 2.8;                                 % startgissning för fixpunkt
x_fix_i = @(x_fix) -sin(2*x_fix) + (5/4) * x_fix - 3/4; % Calculation of x_1 (fix)

% Vectors with the errors to gather the results
error_newton_vector = zeros(1, 100);          
error_fix_vector = zeros(1, 100);

for n = 1:100
    error_newton_vector(n) = abs(x_true - x_newton_i);
    x_newton = x_newton_i;
    f(x_newton);
    fp(x_newton);
    x_newton_i = x_newton - f(x_newton)/fp(x_newton); 
    
    
    error_fix_vector(n) = abs(x_true - x_fix_i(x_fix));
    x_fix = x_fix_i(x_fix);
end

x = 1:100;
figure(1)

semilogy(x, error_newton_vector)
hold on
semilogy(x, error_fix_vector)
title('Errors of the Newton Raphson and Fix point methods')
xlabel('Itterations')
ylabel('Log error')
legend({'Newton Raphson','Fix Point'},'Location','southwest')

% For plotting the order of convergence
newton_convergence_error_1 = error_newton_vector(1:end-1);
newton_convergence_error_2 = error_newton_vector(2:end);
fix_convergence_error_1 = error_fix_vector(1:end-1);
fix_convergence_error_2 = error_fix_vector(2:end);


figure(2)
x = fix_convergence_error_2;
X = x(1:end-1);
loglog(newton_convergence_error_2, newton_convergence_error_1)
hold on
loglog(fix_convergence_error_2, fix_convergence_error_1)
hold on
loglog(X, 1e0*X, '--', X, 1e3*X.^2, '--', X, 3e0*X.^(1/2), '--', X, 5e-1*X.^(1/3), '--')
title('Conversion order for the Newton Raphson and Fix point methods')
xlabel('en')
ylabel('en+1')
legend({'Newton Raphson','Fix Point','x', 'x^2', 'x^(1/2)', 'x^(1/3)'},'Location','southwest')
