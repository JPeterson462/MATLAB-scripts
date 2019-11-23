function BulkIntegralConvergenceRate(f, N, a, b)
    T = @(f, n, a, b) TrapezoidalIntegration(f, n, a, b);
    S = @(f, n, a, b) SimpsonsIntegration(f, n, a, b);
    M = @(f, n, a, b) MidpointIntegration(f, n, a, b);
    fprintf('Convergence rates\n');
    BulkIntegralConvergence(f, N, 'Trapezoidal rule', T, a, b);
    BulkIntegralConvergence(f, N, 'Simpsons rule', S, a, b);
    BulkIntegralConvergence(f, N, 'Midpoint rule', M, a, b);
end

function BulkIntegralConvergence(f, N, name, I, a, b)
    for i = 1:length(N)
        n = N(i);
        r = IntegralConvergenceRate(f, I, n, a, b);
        fprintf('%s for n = %d. result = %.10f\n', name, n, r); 
    end
end