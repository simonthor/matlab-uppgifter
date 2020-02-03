%% Get input from user
clf

tetra = [sqrt(8/9) -sqrt(2/9) -sqrt(2/9) 0;
        0 sqrt(2/3) -sqrt(2/3) 0;
        -1/3 -1/3 -1/3 1];
    
plotTetra(tetra, "k");

angle = 0.5*pi/3;
rotaxis = [0 0 1]' ./ 1;
x = rotaxis(1);
y = rotaxis(2);
z = rotaxis(3);
rotm = [0 -z y; z 0 -x; -y x 0] .* sin(angle) + (eye(3) - rotaxis * rotaxis') .* cos(angle) + rotaxis * rotaxis';
tetra = rotm * tetra;
plotTetra(tetra, "b");

axis equal