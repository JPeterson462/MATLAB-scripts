function X = DFT2(x)
    X = zeros(size(x));
    M = size(x, 1);
    N = size(x, 2);
    for p = 1:M
        for q = 1:N
            X(p, q) = Compute(x, M, N, p, q);
        end
    end
end

function y = Compute(x, M, N, p, q)
    Wm = Wk(M);
    Wn = Wk(N);
    y = 0;
    for j = 1:M
        sum = 0;
        for k=1:N
            sum = sum + Wn(k, q) * x(j, k);
        end
        y = y + Wm(j, p) * sum;
    end
end

function result = Wk(N)
    result = @(j, k) W(N, j, k);
end

function result = W(N, j, k)
    % j-1 and k-1 adjus indexing since MATLAB is 1-indexed
    result = exp(-2 * pi * 1i * (j - 1) * (k - 1) / N);
end