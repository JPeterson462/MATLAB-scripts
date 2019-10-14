function result = HermiteFejerError(a, b, N, f, df)
    X = a:2/N:b;
    F = zeros(length(X), 1);
    dF = zeros(length(X), 1);
    for i=1:length(X)
        F(i) = f(X(i));
        dF(i) = df(X(i));
    end
    HFI = HermiteFejerInterpolant(X, F, dF);
    result = @(z) abs(f(z) - HFI(z));
end