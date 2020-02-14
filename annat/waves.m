x = linspace(-6, 6, 1000);
[X, Y] = meshgrid(x);
wave = surf(X, Y, sin(sqrt(X.^2 + Y.^2)));
set(wave,'LineStyle','none')
