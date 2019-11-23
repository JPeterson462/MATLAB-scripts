function BulkIntegration(f, N, a, b)
    BulkIntegrate(f, N, 'Trapezoidal rule', @(g, n, s, e) TrapezoidalIntegration(g, n, s, e), a, b);
    BulkIntegrate(f, N, 'Simpsons rule', @(g, n, s, e) SimpsonsIntegration(g, n, s, e), a, b);
    BulkIntegrate(f, N, 'Midpoint rule', @(g, n, s, e) MidpointIntegration(g, n, s, e), a, b);
end

function BulkIntegrate(f, N, name, I, a, b)
    for i = 1:length(N)
        n = N(i);
        t = I(f, n, a, b);
        fprintf('%s for n = %d. result = %.10f\n', name, n, t);
    end
end