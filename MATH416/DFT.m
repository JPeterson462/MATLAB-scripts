function X = DFT(x)
    N = length(x);
    X = zeros(N, 1);
    E = exp(-2 * pi * sqrt(-1) / N);
    for n = 0:N-1
        sum = 0;
        for k = 0:N-1
            sum = sum + E ^ (n * k) * x(k + 1);
        end
        X(n + 1) = sum;
    end
end