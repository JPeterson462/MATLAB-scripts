function t = SimpsonsIntegration(f, N, a, b)
    h = (b - a) / N;
    x = @(i) a + i * h;
    M = N / 2;
    t = (h / 3) * (2 * ModifiedSum(f, @(v) x(2 * v), M) + 4 * Sum(f, @(v) x(2 * v + 1), M - 1));
end