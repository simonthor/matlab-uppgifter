clf

corners = zeros(2, 1);
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
        corners(:, i) = inp;
    end
    
    point = num2cell(corners(:, i));
    plot(point{:}, "k.");
    i = i+1;
end

%% Sort points
[~, index] = sort(corners(1,:));
sortedCorners = corners(:, index);

%% Get triangles

[~, numpoints] = size(sortedCorners);
for i = 1:(numpoints-2)
    triangle = sortedCorners(:, i:i+2);
    % TODO: remove this line
    triangle(:, end+1) = triangle(:,1);
    A = [(triangle(:, 3) + triangle(:, 2))/2 - triangle(:, 1) (triangle(:, 3) + triangle(:, 1))/2 - triangle(:, 2)];
    b = triangle(:, 2) - triangle(:, 1);
    x = A\b;
    centroid = A(:, 1) .* x(1) + triangle(:, 1);
    
    % TODO: calculate lines differently
    lines = corners(:, 2:end) - corners(:, 1:end-1);
    area = norm(cross([lines(:, 1); 0], [lines(:, 2); 0]))./2;
    
    plot(centroid(1), centroid(2), ".")
end

hold off
    
