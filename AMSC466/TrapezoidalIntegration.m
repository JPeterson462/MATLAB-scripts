function t = TrapezoidalIntegration(f, N, a, b)
    h = (b - a) / N;
    x = @(i) a + i * h;
    t = h * ModifiedSum(f, x, N);
end