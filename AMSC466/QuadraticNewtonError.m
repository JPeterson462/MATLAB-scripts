function result = QuadraticNewtonError(f, K, a, b, N, v)
    X = a:(b-a)/K:b;
    for t=1:length(N)
        Y = Maximizer(X, @(x) NewtonError(f, x, N(t), a+(v)/K, a+(v+2)/K));
        figure(N(t));
        title(sprintf("N = %d", N(t)));
        plot(X, Y);
    end
end