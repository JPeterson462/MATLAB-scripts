function X = matFFT2(x)
    M = size(x, 1);
    N = size(x, 2);
    assert(M >= 4 && N >= 4);
    Wm = GenerateW(M);
    Wn = GenerateW(N);
    X = Wm * x * Wn;    
end

function W = GenerateW(K)
    assert(IsPow2(K));
    S = eye(K);
    P = eye(K);
    for k = 1:log2(K/4)
        m = 2^(k - 1);
        S = S * CreateS(K, m);
        P = CreateP(K, m) * P;
    end
    B = Base(K, 4);
    W = S * B * P;
end

function b = Base(K, n)
    assert(IsPow2(K));
    b = zeros(K, K);
    for i0 = 0:n:K-1
        for j0 = 0:n:K-1
           if i0 == j0
               for di = 1:n
                  for dj = 1:n
                      b(i0 + di, j0 + dj) = exp(-2 * pi * 1i * (di - 1) * (dj - 1) / K);
                  end
               end
           end
        end
    end
end

function fullS = CreateS(N, K)
    assert(IsPow2(N));
    fullS = zeros(N, N);
    s = S(K);
    for i = 0:K:N-1
       for j = 0:K:N-1
          for di = 1:K
             for dj = 1:K
                 fullS(i + di, j + dj) = s(di, dj);
             end
          end
       end
    end
end

function s = S(K)
    assert(IsPow2(K));
    s = zeros(K, K);
    for i = 1:K/2
       for j = 1:K/2
           if i == j
               s(i, j) = 1;
               s(i, j + K/2) = exp(-2 * pi * 1i * j / K);
               s(i + K/2, j) = exp(-2 * pi * 1i * i / K);
               s(i + K/2, j + K/2) = exp(-2 * pi * 1i * (i + j) / K);
           end
       end
    end
end

function fullP = CreateP(N, K)
    assert(IsPow2(N));
    fullP = zeros(N, N);
    p = P(K);
    for i = 0:K:N-1
       for j = 0:K:N-1
          for di = 1:K
             for dj = 1:K
                 fullP(i + di, j + dj) = p(di, dj);
             end
          end
       end
    end
end

function p = P(K)
    assert(IsPow2(K));
    p = zeros(K, K);
    for i = 1:2:K/2
    	p(i, 2 * i - 1) = 1;
    	p(i + 1, 2 * i + 1) = 1;
    	p(K/2 + i, 2 * i) = 1;
        p(K/2 + i + 1, 2 * i + 2) = 1;
    end
end

function result = IsPow2(k)
    p = log2(k);
    result = p == round(p);
end