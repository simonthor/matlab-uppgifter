%% Draw circles
clf
phi = linspace(0, 2*pi, 100);
hold on
for r=1:10
    plot(r .* cos(phi), r .* sin(phi), "k");
end

%% Throw darts
nDarts = 10;
throws = [5 * randn(nDarts, 1) 4 * randn(nDarts, 1)];
scatter(throws(:, 1), throws(:, 2), 100, "r.");

hold off
axis equal

%% Calculate points
distance = vecnorm(throws');
points = 10 - floor(distance);
points(points < 0) = 0;
disp("points for each throw: " + num2str(points));