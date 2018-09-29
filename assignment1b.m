x = 1;
x_i = -sin(2*x) + (5/4) * x - 3/4;
counter = 1;

while abs(x - x_i) > 1e-6
    x = x_i;
    x_i = -sin(2*x) + (5/4) * x - 3/4;
    counter = counter + 1;
end


% Samma kod som ovan fast med en funktion istället
sprintf('%.10f' , x)

x = 1;
f = @(x) -sin(2*x)+(5/4)*x-3/4;
TOL = 1e-6;

result = newton(g, x, x_i, TOL);
sprintf('%.10f' , result)