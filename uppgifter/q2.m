x = linspace(-2, 4, 1000);
y = 10./sqrt(1+x.^2) + exp(x./2) ./ (sqrt(2) + sin(pi.*x)) + 4./(x-5);
plot(x, y)