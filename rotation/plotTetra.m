function plotTetra(tetra, color)
    plot3(tetra(1, :), tetra(2, :), tetra(3,:), "k.");
    %cla
    hold on
    pointcombinations = nchoosek(1:4, 2);
    for points=pointcombinations'
        plot3(tetra(1, points), tetra(2, points), tetra(3, points), color + "-");
    end
    % hold off
end

