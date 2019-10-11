function result = MaxPlotter(f, K, a, b, N)
    X = a:(b-a)/K:b;
    for t=1:length(N)
        Y = Maximizer(X, @(x) NewtonError(f, x, N(t), a, b));
        figure(N(t));
        title(sprintf("N = %d", N(t)));
        plot(X, Y);
    end
end