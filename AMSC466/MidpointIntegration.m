function t = MidpointIntegration(f, N, a, b)
    h = (b - a) / N;
    x = @(i) a + i * h;
    M = N / 2;
    t = 2 * h * Sum(f, @(v) x(2 * v + 1), M - 1);
end