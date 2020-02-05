n = [1 1 1];
uv = null(n);
u = uv(:, 1);
v = uv(:, 2);
x = [0 u(1); v(1) u(1) + v(1)];
y = [0 u(2); v(2) u(2) + v(2)];
z = [0 u(3); v(3) u(3) + v(3)];

surf(x, y, z)
hold on
plot3([0 n(1)], [0 n(2)], [0 n(3)])
hold off
axis equal