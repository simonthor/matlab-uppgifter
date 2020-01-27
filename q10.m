alpha = 3.7415e-16;
beta = 0.014388;
T = (3:6) * 1000;
lambda = linspace(0, 250e-8, 1001);
lambda = lambda(2:end);
linecolors = spring(length(T));

hold on
for i=1:length(T)
    t = T(i);
    w = alpha ./ (lambda.^5 .* (exp(beta ./ (lambda .* t)) - 1));
    plot(lambda, w, "color", linecolors(i,:));
    [maxpoint, maxindex] = max(w);
    text(lambda(maxindex), maxpoint * 1.1, "T=" + num2str(t) + " K");
end
