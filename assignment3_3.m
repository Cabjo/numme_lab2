
f1 = @(x) 3.9*x*exp(1.95*x^2);
f2 = @(y) 0.9801*exp(0.9801*y);
f3 = @(x) 4.1*x*exp(2.05*x^2);
f4 = @(y) 1.0201*exp(1.0201*y);


sprintf('%.10f' , f1(0.99))
sprintf('%.10f' , f1(1.01))
sprintf('%.10f' , f2(1.95))
sprintf('%.10f' , f2(2.05))
sprintf('%.10f' , f3(0.99))
sprintf('%.10f' , f3(1.01))
sprintf('%.10f' , f4(1.95))
sprintf('%.10f' , f4(2.05))