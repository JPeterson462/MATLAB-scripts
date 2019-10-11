function result = Frame(A, B, f1, f2, f3, k, y)
    S1 = [f1 f2 f3];
    S2 = transpose(S1);
    S = S1 * S2;
    a = round(2 / (A + B), 3);
    X = zeros(length(f1), 1);
    M = a * S;
    for i = 1:k
        X = X + M*(y - X);
    end
    result = X;
end