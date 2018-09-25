x = 3;
f = x - 4*sin(2*x) - 3;
fp = 1 - 8*cos(2*x);
x_i = x - f/fp;

counter = 1;

while abs(x - x_i) > 10^(-80)
    x = x_i;
    f = x - 4*sin(2*x) - 3;
    fp = 1 - 8*cos(2*x);
    x_i = x - f/fp;
    counter = counter + 1;
end

sprintf('%.80f' , x)