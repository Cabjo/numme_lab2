x = 1;
x_i = -sin(2*x) + (5/4) * x - 3/4;
counter = 1;

while abs(x - x_i) > 10^(-10)
    x = x_i;
    x_i = -sin(2*x) + (5/4) * x - 3/4;
    counter = counter + 1;
end

sprintf('%.10f' , x)