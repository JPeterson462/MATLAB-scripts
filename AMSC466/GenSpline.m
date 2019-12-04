function result = GenSpline(x, f, N)
    X = PointGenerator(@(k) x(k), 0:N);
    F = PointGenerator(@(k) f(x(k)), 0:N);
    result = Spline(X, F);
end