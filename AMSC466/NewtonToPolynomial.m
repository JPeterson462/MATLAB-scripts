function result = NewtonToPolynomial(P, X)
    assert(length(P) == 6 || length(P) == 5); % Only works for 4th/5th degree polynomials
    if length(P) == 6
        x0 = X(1);
        x1 = X(2);
        x2 = X(3);
        x3 = X(4);
        x4 = X(5);
        p0 = P(1);
        p1 = P(2);
        p2 = P(3);
        p3 = P(4);
        p4 = P(5);
        p5 = P(6);
        A = zeros(6, 1);
        A(1) = p0 - p1 * x0 + p2 * x0 * x1 - p3 * x0 * x1 * x2 + p4 * x0 * x1 * x2 * x3 - p5 * x0 * x1 * x2 * x3 * 4;
        A(2) = p1 - p2 * (x0 + x1) + p3 * (x0 * x1 + x0 * x2 + x1 * x2) - p4 * (x0 * x1 * x2 + x0 * x1 * x3 + x0 * x2 * x3 + x1 * x2 * x3) + p5 * (x0 * x1 * x2 * x3 + x0 * x1 * x2 * x4 + x0 * x1 * x3 * x4 + x0 * x2 + x3 * x4 + x1 * x2 * x3 * x4);
        A(3) = p2 - p3 * (x0 + x1 + x2) + p4 * (x0 * x1 + x0 * x2 + x0 * x3 + x1 * x2 + x1 * x3 + x2 * x3) - p5 * (x0 * x1 * x2 + x0 * x1 * x3 + x0 * x1 * x4 + x0 * x2 * x3 + x0 * x3 * x4 + x1 * x2 * x3 + x1 * x2 * x4 + x1 * x3 * x4 + x2 * x3 * x4);
        A(4) = p3 - p4 * (x0 + x1 + x2 + x3) + p5 * (x0 * x1 + x0 * x2 + x0 * x3 + x0 * x4 + x1 * x2 + x1 * x3 + x1 * x4 + x2 * x3 + x2 * x4 + x3 * x4);
        A(5) = p4 - p5 * (x0 + x1 + x2 + x3 + x4);
        A(6) = p5;
        result = A;
    elseif length(P) == 5
        x0 = X(1);
        x1 = X(2);
        x2 = X(3);
        x3 = X(4);
        p0 = P(1);
        p1 = P(2);
        p2 = P(3);
        p3 = P(4);
        p4 = P(5);
        A = zeros(5, 1);
        A(1) = p0 - p1 * x0 + p2 * x0 * x1 - p3 * x0 * x1 * x2 + p4 * x0 * x1 * x2 * x3;
        A(2) = p1 - p2 * (x0 + x1) + p3 * (x0 * x1 + x0 * x2 + x1 * x2) - p4 * (x0 * x1 * x2 + x0 * x1 * x3 + x0 * x2 * x3 + x1 * x2 * x3);
        A(3) = p2 - p3 * (x0 + x1 + x2) + p4 * (x0 * x1 + x0 * x2 + x0 * x3 + x1 * x2 + x1 * x3 + x2 * x3);
        A(4) = p3 - p4 * (x0 + x1 + x2 + x3);
        A(5) = p4;
        result = A;
    end
end