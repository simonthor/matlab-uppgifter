function plotTetra(tetra, color)
    % plot the edges of a tetrahedron in the specified color.
    % Gets all combinations of vertices and plots a line between each.
    plot3(tetra(1, :), tetra(2, :), tetra(3,:), "k.");
    hold on
    pointcombinations = nchoosek(1:4, 2);
    for points=pointcombinations'
        plot3(tetra(1, points), tetra(2, points), tetra(3, points), color + "-");
    end
end

