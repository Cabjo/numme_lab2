x = -3:.00001:8;
y = x - 4*sin(2*x) - 3;

z = -3:8;
l = 0 * z;
figure(1)

plot(x, y)
hold on
plot(z, l)

