%% Draw and calculate triangle
corners = [0 4 6.5; 1.42 6.18 4.75];
corners(:, end+1) = corners(:,1);

subplot(1, 3, 1);
plot(corners(1,:), corners(2, :));
axis equal
pbaspect([1 1 1])

lines = corners(:, 2:end) - corners(:, 1:end-1);
circumference = sum(vecnorm(lines));
disp("circumference: " + num2str(circumference));
area = norm(cross([lines(:, 1); 0], [lines(:, 2); 0]));
disp("area: " + area);

%% Draw and calculate circle
phi = linspace(0, 2*pi, 60);
r1 = 3;

subplot(1, 3, 2);
plot(corners(1,:), corners(2, :), ".--");
hold on
plot(corners(1,1) + r1.*cos(phi), corners(2, 1) + r1.*sin(phi));
hold off
axis equal
pbaspect([1 1 1])

%% Draw tangental circles
s = vecnorm(lines)';
A = [1 1 0; 0 1 1; 1 0 1];
r = A\s;

subplot(1, 3, 3);
hold on
for i=1:3
    x = corners(1,i) + r(i).*cos(phi);
    y = corners(2, i) + r(i).*sin(phi);
    plot(x, y);
    fill(x, y, "r");
    alpha(0.5);
end
plot(corners(1,:), corners(2, :), ".--");
hold off
axis equal
pbaspect([1 1 1])

%% Final adjustments
set(gcf,'position',[500, 500, 600, 200])

