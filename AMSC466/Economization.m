function result = Economization(A, T)
    assert(length(A) == 6 || length(A) == 5); % only written for 4th/5th degree polynomials
    assert(length(T) == 6 || length(T) == 5);
    N = length(A) - 2;
    if length(A) == 6
        a5 = A(6);
        a4 = A(5);
        a3 = A(4);
        a2 = A(3);
        a1 = A(2);
        a0 = A(1);
        t5 = T(6);
        t4 = T(5);
        t3 = T(4);
        t2 = T(3);
        t1 = T(2);
        t0 = T(1);
        b4 = a4 - a5 * t4 / 2^N;
        b3 = a3 - a5 * t3 / 2^N;
        b2 = a2 - a5 * t2 / 2^N;
        b1 = a1 - a5 * t1 / 2^N;
        b0 = a0 - a5 * t0 / 2^N;
        result = [b0 b1 b2 b3 b4];
    elseif length(A) == 5
        a4 = A(5);
        a3 = A(4);
        a2 = A(3);
        a1 = A(2);
        a0 = A(1);
        t3 = T(4);
        t2 = T(3);
        t1 = T(2);
        t0 = T(1);
        b3 = a3 - a4 * t3 / 2^N;
        b2 = a2 - a4 * t2 / 2^N;
        b1 = a1 - a4 * t1 / 2^N;
        b0 = a0 - a4 * t0 / 2^N;
        result = [b0 b1 b2 b3];        
    end
end