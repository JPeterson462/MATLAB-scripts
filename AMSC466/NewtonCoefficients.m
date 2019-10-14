function result = NewtonCoefficients(f, X, N)
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
    result = p;
end