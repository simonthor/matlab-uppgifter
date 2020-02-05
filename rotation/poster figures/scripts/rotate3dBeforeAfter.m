%% Create and plot tetrahedron with center in origin
clf
axis equal 
axis off

tetra = [sqrt(8/9) -sqrt(2/9) -sqrt(2/9) 0;
        0 sqrt(2/3) -sqrt(2/3) 0;
        -1/3 -1/3 -1/3 1];

plotTetra(tetra, "k");

savefig("poster figures\\figures\\3DTetraBefore.fig")

%% Rotate tetrahedron
cla
angle = pi/6;
rotaxis = [0 0 1]';
x = rotaxis(1);
y = rotaxis(2);
z = rotaxis(3);
% rotation matrix
rotm = [0 -z y; z 0 -x; -y x 0] .* sin(angle) + (eye(3) - rotaxis * rotaxis') .* cos(angle) + rotaxis * rotaxis';
tetra = rotm * tetra;

plotTetra(tetra, "b");

savefig("poster figures\\figures\\3DTetraAfter.fig")
