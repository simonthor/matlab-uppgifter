clear all
%figure
x = linspace(0, 4, 1000);
f = x.*(1 + sin(pi*x));
g = 5*exp(-x./2)./(3-2*cos(2*pi*x));
subplot(2,2,1);
plot(x, f);
hold on
plot(x, g);
hold off
title('f(x) och g(x)');
subplot(2,2,2);
plot(x, f+g);
title('f(x) + g(x)');
subplot(2,2,3);
plot(x, f.*g);
title('f(x) * g(x)');
subplot(2,2,4);
plot(x, f./g);
title('f(x) / g(x)');


