function X = matDFT(x)
    N = length(x);
    W = generateW(N, N, N);
    X = W * x;
end

function W = generateW(C, M, N)
    W = zeros(M, N);
    for m = 1:M
       for n = 1:N
           W(m, n) = computeW(C, m, n);
       end
    end
end

function result = computeW(N, j, k)
    % j-1 and k-1 adjus indexing since MATLAB is 1-indexed
    result = exp(-2 * pi * 1i * (j - 1) * (k - 1) / N);
end