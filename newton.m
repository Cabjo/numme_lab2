function result = newton(f, x, x_i, TOL)

while abs(x - x_i) > TOL
    x = x_i;
    x_i = f(x);
end
result = x_i;
end 