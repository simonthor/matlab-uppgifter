clf

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
plot(corners(1, :), corners(2, :), "b-")
for i = 1:(numpoints-2)
    triangle = sortedPoints(:, i:i+2);
    A = [(triangle(:, 3) + triangle(:, 2))/2 - triangle(:, 1) (triangle(:, 3) + triangle(:, 1))/2 - triangle(:, 2)];
    b = triangle(:, 2) - triangle(:, 1);
    x = A\b;
    centroid = A(:, 1) .* x(1) + triangle(:, 1);
    
    plot([triangle(1, :) triangle(1, 1)], [triangle(2, :) triangle(2, 1)], "b--")
    
    plot(centroid(1), centroid(2), "k.", 'MarkerSize' ,20)
end

axis equal
hold off