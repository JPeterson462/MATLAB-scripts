function X = matFFT2(x)
    M = size(x, 1);
    N = size(x, 2);
    assert(M >= 4 && N >= 4);
    %Wm = GenerateW(M);
    %Wn = GenerateW(N);
    %X = Wm * x * Wn;
    X = x;
    m = M;
    B4 = zeros(4, 4);
    for p = 1:4
        for q = 1:4
            B4(p, q) = exp(-2 * pi * 1i * (p - 1) * (q - 1) / 4);
        end
    end
    while m >= 4
        X = LeftP(M, m, X);
        m = m / 2;
    end
    %disp(m);
    X = LeftBase(M, X, B4);
    while m <= M
        X = LeftS(M, m, X);
        m = m * 2;
    end
    n = N;
    while n >= 4
       X = RightS(N, n, X);
       n = n / 2;
    end
    %disp(n);
    X = RightBase(N, X, B4);
    while n <= N
        %disp('RightP');
        %disp([N n]);
        X = RightP(N, n, X);
        n = n * 2;
    end
    %disp(B4);
    X = RightBase(N, LeftBase(M, X, B4), B4);
end

function X = LeftP(N, K, x)
    X = zeros(N, N);
    for p = 1:N
        for q = 1:N
            sum = 0;
            d = mod(p, K);
            if d <= K/2
            	i = 1;
            else
                i = 2;
            end
            for k = i:K:N
                sum = sum + x(k, q);
            end
            X(p, q) = sum;
        end
    end
end

function X = RightP(N, K, x)
    X = zeros(N, N);
    for p = 1:N
        for q = 1:N
            sum = 0;
            d = mod(q, K);
            if d <= K/2
            	i = 1;
            else
                i = 2;
            end
            for k = i:K:N
                sum = sum + x(p, k);
            end
            X(p, q) = sum;
        end
    end
end

function X = LeftBase(N, x, B4)
    X = zeros(N, N);
    for p = 1:4:N
        for q = 1:4:N
            m = B4 * x(p:p+3, q:q+3);
            for dp = 0:3
                for dq = 0:3
                    X(p + dp, q + dq) = m(dp + 1, dq + 1);
                end
            end
        end
    end
end

function X = RightBase(N, x, B4)
    X = zeros(N, N);
    for p = 1:4:N
        for q = 1:4:N
            m = x(p:p+3, q:q+3) * B4;
            for dp = 0:3
                for dq = 0:3
                    X(p + dp, q + dq) = m(dp + 1, dq + 1);
                end
            end
        end
    end
end

function result = ComputeS(P, Q, dp, dq)
    if P == 0
       if Q == 0
           result = 0;
       else
           result = dq;
       end
    else
       if Q == 0
           result = dp;
       else
           result = dp + dq;
       end
    end
end

function X = LeftS(N, K, x)
    E = exp(-2 * pi * 1i / N);
    X = zeros(N, N);
    for p = 1:N
        for q = 1:N
            P = mod(floor(p / K), 2);
            Q = mod(floor(q / K), 2);
            dp = mod(p - 1, K);
            dq = mod(q - 1, K);
            sum = 0;
            for k = 1:K:N
                s = E^ComputeS(P, Q, dp, dq);
                sum = sum + s * x(k, q);
            end
            X(p, q) = sum;
        end
    end
end

function X = RightS(N, K, x)
    E = exp(-2 * pi * 1i / N);
    X = zeros(N, N);
    for p = 1:N
        for q = 1:N
            P = mod(floor(p / K), 2);
            Q = mod(floor(q / K), 2);
            dp = mod(p - 1, K);
            dq = mod(q - 1, K);
            sum = 0;
            for k = 1:K:N
                s = E^ComputeS(Q, P, dp, dq);
                sum = sum + x(p, k) * s;
            end
            X(p, q) = sum;
        end
    end
end

%{
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
%}

function result = IsPow2(k)
    p = log2(k);
    result = p == round(p);
end