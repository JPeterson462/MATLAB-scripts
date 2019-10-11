function result = NewtonError(f, x, N, a, b)
    A = NewtonInterpolant(f, N, a, b);
    result = abs(f(x) - A(x));
end