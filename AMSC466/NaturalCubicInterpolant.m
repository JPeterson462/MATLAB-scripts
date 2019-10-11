function result = NaturalCubicInterpolant(f, X, N)
    s = S(f, X, N);
    result = @(x) Spline(x, N, s, f, X);
end

function result = Spline(x, N, S, f, X)
    t = 0;
    for v=0:N-1
        if X(v) <= x && x < X(v + 1)
            Cv = C(f, X, v, S);
            t = 1;
            result = Cv(x);
        end
    end
    if t == 0
        Cv = C(f, X, N - 1, S);
        result = Cv(x);
    end
end
function result = C1(f, X, v, S, x, dx)
    a = (1 + (2 * (x - X(v))/dx));
    d1 = (x - X(v + 1))/dx;
    s = S(v + 0 + 1);
    F = f(X(v));
    result = (F * a + s * (x - X(v))) * d1 * d1;
end
function result = C2(f, X, v, S, x, dx)
    b = (1 - (2 * (x - X(v + 1))/dx));
    d0 = (x - X(v))/dx;
    s = S(v + 1 + 1);
    F = f(X(v + 1));
    result = (F * b + s * (x - X(v + 1))) * d0 * d0;
end
function result = C(f, X, v, S)
    dx = X(v + 1) - X(v);
    result = @(x) C1(f, X, v, S, x, dx) + C2(f, X, v, S, x, dx);
end
function result = S(f, X, N)
    M = zeros(N + 1, N + 1);
    for i=1:N+1
        for j=1:N+1
            if i == j
               M(i, j) = 2/3;
            elseif j == i + 1
                if i == 1
                    M(i, j) = 1/3;
                elseif i == N + 1
                    % ignore
                else
                    M(i, j) = (1/3) * ThetaR(X, i - 1);
                end
            elseif j == i - 1
                if i == 1
                    % ignore
                elseif i == N + 1
                    M(i, j) = 1/3;
                else
                    M(i, j) = (1/3) * ThetaL(X, i - 1);
                end
            end
        end
    end
    B = zeros(N + 1, 1);
    for i=1:N+1
        B(i, 1) = R(f, X, i - 1, N);
    end
    result = M\B;
end
function result = R(f, X, v, N)
    if v == 0
        result = DividedDifference(f, X, v);
    elseif v == N
        result = DividedDifference(f, X, v - 1);
    else
        result = ThetaL(X, v) * DividedDifference(f, X, v - 1) + ThetaR(X, v) * DividedDifference(f, X, v);
    end
end
function result = DividedDifference(f, X, v)
    x0 = X(v);
    x1 = X(v + 1);
    y0 = f(x0);
    y1 = f(x1);
    result = (y1 - y0)/(x1 - x0);
end
function result = ThetaL(X, v)
    result = (X(v + 1) - X(v)) / (X(v + 1) - X(v - 1));
end
function result = ThetaR(X, v)
    result = (X(v) - X(v - 1)) / (X(v + 1) - X(v - 1));
end
