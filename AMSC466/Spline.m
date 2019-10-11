function result = Spline(X, f, N)
    % Compute the slopes of the spline
    M = zeros(N+1, N+1);
    for i=1:N+1
        for j=1:N+1
            if j == i - 1
                if i == N+1
                    M(i, j) = 1/3;
                elseif i > 1
                    v = i - 1;
                    M(i, j) = (1/3) * (X(v + 1) - X(v)) / (X(v + 1) - X(v - 1));
                end
            elseif j == i
                M(i, j) = 2/3;
            elseif j == i + 1
                if i == 1
                    M(i, j) = 1/3;
                elseif i < N+1
                    v = i - 1;
                    M(i, j) = (1/3) * (X(v) - X(v - 1)) / (X(v + 1) - X(v - 1));
                end
            end
        end
    end
    R = zeros(N+1, 1);
    for i=1:N+1
        if i == 1
            R(i) = (f(X(1)) - f(X(0))) / (X(1) - X(0));
        elseif i == N
            R(i) = (f(X(N)) - f(X(N-1))) / (X(N) - X(N-1));
        else
            v = i-1;
            a = ((X(v + 1) - X(v)) / (X(v + 1) - X(v - 1))) * (f(X(v)) - f(X(v - 1))) / (X(v) - X(v - 1));
            b = ((X(v) - X(v - 1)) / (X(v + 1) - X(v - 1))) * (f(X(v + 1)) - f(X(v))) / (X(v + 1) - X(v));
            R(i) = a + b;
        end
    end
    disp(M);
    disp(R);
    S = M\R;
    % Compute each cubic Hermite interpolant
    result = @(x) SN(S, X, f, x, N);
end

function result = SN(S, X, f, x, N)
    for v=0:N-1
        if X(v) <= x < X(v + 1)
            result = C(v, S, X, f, x, N);
        end
    end
    if x == X(N)
        result = C(N - 1, S, X, f, x, N);
    end
end
function result = C(v, S, X, f, x, N)
    dx = X(v + 1) - X(v);
    dx1 = x - X(v + 1);
    dx0 = x - X(v);
    result = (1 / (dx * dx)) * (((f(X(v)) * (1 + 2 * dx0 / dx) + S(v + 0 + 1) * dx0) * dx1 * dx1) + ((f(X(v + 1)) * (1 - 2 * dx1 / dx) + S(v + 1 + 1) * dx1) * dx0 * dx0));
end