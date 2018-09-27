x = -3:.0001:8;
y = -sin(2*x) + (5/4) * x - 3/4;

z = -3:8;
l = z;
figure(1)

plot(x, y)
hold on
plot(z, l)

