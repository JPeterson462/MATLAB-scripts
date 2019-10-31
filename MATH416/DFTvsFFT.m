function DFTvsFFT(f, n, dn, N)
    X = n:dn:N;
    Y1 = Zeros(length(X));
    Y2 = Zeros(length(X));
    for k = X
        T = CompareTimes(f, k);
        Y1((k - n) / dn + 1) = T(1);
        Y2((k - n) / dn + 1) = T(2);
    end
    plot(X, Y1, 'r', X, Y2, 'b');
end

function result = Zeros(N)
    M = zeros(N, 1);
    result = M(:, 1);
end

function result = CompareTimes(f, k)
    X = GenerateX(f, k);
    Td = timeit(@() DFT(X));
    Tf = timeit(@() fft(X));
    result = [Td Tf];
end

function X = GenerateX(f, N)
    X = zeros(N + 1, 1);
    for k = 0:N
       X(k + 1) = f(k); 
    end
end