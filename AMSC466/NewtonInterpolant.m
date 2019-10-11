% x_j = x_(j - 1) = 2/N

function result = NewtonInterpolant(f, X, N)
    M = zeros(N + 1, N + 1);
    for v=1:N+1
        M(v,1) = f(X(v));
    end
    for k=2:N+1
        for v=1:N+1-(k-1)
            dx = X(k - 1 + v) - X(v);
            M(v,k) = (M(v+1,k-1)-M(v,k-1))/(dx);
        end
    end
    p_ = (zeros(N + 1, 1));
    p = p_(:,1);
    for v=1:N+1
        p(N+1-v+1) = M(1,N+1-v+1);
    end
    result = @(y) P(X, p, N, y);
end

function result = Pi(X, v, y)
    if v == 0
        result = y^0;
    else
        result = (y - X(v)) * Pi(X, v - 1, y);
    end
end

function result = P(X, p, k, x)
    if k < 0
        result = 0;
    else
        result = p(k + 1) * Pi(X, k, x) + P(X, p, k - 1, x);
    end
end