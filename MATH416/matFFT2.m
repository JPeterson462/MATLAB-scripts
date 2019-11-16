function X = matFFT2(x)
    M = size(x, 1);
    N = size(x, 2);
    assert(M >= 4 && N >= 4);
    Em = M;
    En = N;
    disp(exp(-2 * pi * 1i / Em));
    Wm = GenerateW(M, Em);
    disp(exp(-2 * pi * 1i / En));
    Wn = GenerateW(N, En);
    X = Wm * x * Wn;    
end

function W = GenerateW(K, E)
    assert(IsPow2(K));
    S = eye(K);
    P = eye(K);
    for k = 1:log2(K/4)
        m = 2^(k - 1);
        disp(m);
        S = S * CreateS(K, m, E);
        P = CreateP(K, m) * P;
    end
    B = Base(K, E, 4);
    disp(B);
    W = S * B * P;
end

function b = Base(K, E, n)
    assert(IsPow2(K));
    b = zeros(K, K);
    for i0 = 1:n:K
        for j0 = 1:n:K
           if i0 == j0
               for di = 1:n
                  for dj = 1:n
                      b(i0 - 1 + di, j0 - 1 + dj) = exp(-2 * pi * 1i * (di - 1) * (dj - 1) / E);
                  end
               end
           end
        end
    end
end

function fullS = CreateS(N, K, E)
    assert(IsPow2(N));
    fullS = zeros(N, N);
    s = S(K, E);
    for i = 1:N/K:N
       for j = 1:N/K:N
          for di = 1:K
             for dj = 1:K
                 disp([(i - 1) + di, (j - 1) + dj, di, dj]);
                 fullS((i - 1) + di, (j - 1) + dj) = s(di, dj);
             end
          end
       end
    end    
end

function s = S(K, E)
    assert(IsPow2(K));
    s = zeros(K, K);
    for i = 1:K/2
       for j = 1:K/2
           if i == j
               s(i, j) = 1;
               s(i, j + K/2) = exp(-2 * pi * 1i * j / E);
               s(i + K/2, j) = exp(-2 * pi * 1i * i / E);
               s(i + K/2, j + K/2) = exp(-2 * pi * 1i * (i + j) / E);
           end
       end
    end
end

function fullP = CreateP(N, K)
    assert(IsPow2(N));
    fullP = zeros(N, N);
    p = P(K);
    for i = 1:N/K:N
       for j = 1:N/K:N
          for di = 1:K
             for dj = 1:K
                 fullP((i - 1) + di, (j - 1) + dj) = p(di, dj);
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