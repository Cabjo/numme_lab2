x_true = 3.161826486551946;

x_newton = 2.8;
f = x_newton - 4*sin(2*x_newton) - 3;
fp = 1 - 8*cos(2*x_newton);
x_newton_i = x_newton - f/fp;

x_fix = 2.8;
x_fix_i = -sin(2*x_fix) + (5/4) * x_fix - 3/4;

error_newton_vector = zeros(1, 100);
error_fix_vector = zeros(1, 100);

for n = 1:100
    error_newton_vector(n) = abs(x_true - x_newton_i);
    x_newton = x_newton_i;
    f = x_newton - 4*sin(2*x_newton) - 3;
    fp = 1 - 8*cos(2*x_newton);
    x_newton_i = x_newton - f/fp;
    
    
    error_fix_vector(n) = abs(x_true - x_fix_i);
    x_fix = x_fix_i;
    x_fix_i = -sin(2*x_fix) + (5/4) * x_fix - 3/4;
end

x = 1:100;
figure(1)

semilogy(x, error_newton_vector)
hold on
semilogy(x,error_fix_vector)
title('Errors of the Newton Raphson and Fix point methods')
xlabel('Itterations')
ylabel('Log error')
legend({'Newton Raphson','Fix Point'},'Location','southwest')


newton_convergence_error_1 = error_newton_vector(1:99);
newton_convergence_error_2 = error_newton_vector(2:100);
fix_convergence_error_1 = error_fix_vector(1:99);
fix_convergence_error_2 = error_fix_vector(2:100);

newton_convergence_error_ratio = newton_convergence_error_1./newton_convergence_error_2;
fix_convergence_error_ratio = fix_convergence_error_1./fix_convergence_error_2;

figure(2)
x = 1:99;
loglog(newton_convergence_error_2, newton_convergence_error_1)
hold on
loglog(fix_convergence_error_2, fix_convergence_error_1)
title('Conversion Rate for the Newton Raphson and Fix point methods')
xlabel('en')
ylabel('en+1')
legend({'Newton Raphson','Fix Point'},'Location','southwest')
