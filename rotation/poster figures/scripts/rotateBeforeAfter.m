%% Get input from user
clf
axis equal

points= zeros(2, 1);
xlim([-10 10]);
ylim([-10 10]);
title("press enter to end input");

hold on
i = 1;
while 1
    inp = ginput(1)';
    if size(inp) == [0 0]
        break
    else
        points(:, i) = inp;
    end
    
    point = num2cell(points(:, i));
    plot(point{:}, "k.");
    i = i+1;
end

%% Sort points based on x
[~, index] = sort(points(1,:));
sortedPoints = points(:, index);

%% Order in polygon shape
corners = points(:, convhull(points(1, :), points(2, :)));

%% Get triangles and calculate centroids
polycenter = zeros(2, 1);
polyarea = zeros(1);
[~, numpoints] = size(sortedPoints);

for i = 1:(numpoints-2)
    triangle = sortedPoints(:, i:i+2);
    A = [(triangle(:, 3) + triangle(:, 2))/2 - triangle(:, 1) (triangle(:, 3) + triangle(:, 1))/2 - triangle(:, 2)];
    b = triangle(:, 2) - triangle(:, 1);
    x = A\b;
    centroid = A(:, 1) .* x(1) + triangle(:, 1);
    
    lines = points(:, 2:end) - points(:, 1:end-1);
    area = norm(cross([lines(:, 1); 0], [lines(:, 2); 0]))./2;
    
    polycenter = polycenter + centroid * area;
    polyarea(i) = area;
end

%% Plot shape
cla
shape = fill(corners(1, :), corners(2, :), 'r');

%% Get center of polygon
polycenter = polycenter ./ sum(polyarea);
plot(polycenter(1), polycenter(2), "*");

savefig("2DPolygonBeforeRotation.fig")
%% Rotate around center
angle = pi/3;
rotation = [cos(angle) -sin(angle); sin(angle) cos(angle)];

% for loop rotates the shape by a small angle each time to create an
% animation
x = get(shape, "XData");
y = get(shape, "YData");
rotated = rotation * ([x'; y'] - polycenter) + polycenter;
set(shape, "XData", rotated(1, :));
set(shape, "YData", rotated(2, :));

drawnow
hold off
savefig("2DPolygonAfterRotation.fig")
