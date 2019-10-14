function result = Spline(X, F)
    N = length(X) - 1;
    ThetaLeft = zeros(N - 1, 1);
    ThetaRight = zeros(N - 1, 1);
    for v=1:N-1
        dx = (GetByZeroIndex(X, v + 1) - GetByZeroIndex(X, v - 1));
        ThetaLeft(v) = (GetByZeroIndex(X, v + 1) - GetByZeroIndex(X, v)) / dx;
        ThetaRight(v) = (GetByZeroIndex(X, v) - GetByZeroIndex(X, v - 1)) / dx;
    end
    DividedDifference = @(v) (GetByZeroIndex(F, v + 1) - GetByZeroIndex(F, v))/(GetByZeroIndex(X, v + 1) - GetByZeroIndex(X, v));
    R = zeros(N + 1, 1);
    R(1) = DividedDifference(0);
    for v=1:N-1
        R(v + 1) = ThetaLeft(v) * DividedDifference(v - 1) + ThetaRight(v) * DividedDifference(v);
    end
    R(N + 1) = DividedDifference(N - 1);
    M = zeros(N + 1, N + 1);
    for i=1:N+1
        M(i, i) = 2/3;
        if i == 1
            M(i, i + 1) = 1/3;
        elseif i == N+1
            M(i, i - 1) = 1/3;
        else
            M(i, i - 1) = (1/3) * ThetaLeft(i - 1);
            M(i, i + 1) = (1/3) * ThetaRight(i - 1);
        end
    end
    S = M\R;
    SN = @(x) C(F, X, x, S, N);
    result = SN;
end

function result = C(F, X, x, S, N)
    if x == GetByZeroIndex(X, N)
        result = Cv(F, X, x, S, N - 1);
    else
        for v=0:N-1
            X0 = GetByZeroIndex(X, v);
            X1 = GetByZeroIndex(X, v + 1);
            if X0 <= x && x < X1
                result = Cv(F, X, x, S, v);
            end
        end
    end
end

function result = Cv(F, X, x, S, v)
    F0 = GetByZeroIndex(F, v);
    F1 = GetByZeroIndex(F, v + 1);
    X0 = GetByZeroIndex(X, v);
    X1 = GetByZeroIndex(X, v + 1);
    dx = X1 - X0;
    A = 1 + 2 * (x - X0) / dx;
    B = 1 - 2 * (x - X1) / dx;
    C1 = (F0 * A + GetByZeroIndex(S, v) * (x - X0)) * ((x - X1) / dx)^2;
    C2 = (F1 * B + GetByZeroIndex(S, v + 1) * (x - X1)) * ((x - X0) / dx)^2;
    result = C1 + C2;
end

function result = GetByZeroIndex(A, i)
    result = A(i + 1);
end