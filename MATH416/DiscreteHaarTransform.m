function X = DiscreteHaarTransform(x, e)
    L = length(x);
    X = zeros(L, 1);
    C = x;
    offset = 0;
    while L > 1
        disp(L);
        M = Threshold(CreateW(L) * C, e);
        Cn = M(1:length(M)/2);
        Dn = M(length(M)/2+1:length(M));
        for k = 1:length(Dn)
            X(k + offset) = Dn(k);
        end
        offset = offset + L/2;
        C = Cn;
        L = L/2;
    end
end

function W = CreateW(L)
    W = zeros(L, L);
    for p = 1:L/2
        W(p, 2 * p - 1) = 1;
        W(p, 2 * p) = 1;
        W(p + L/2, 2 * p - 1) = 1;
        W(p + L/2, 2 * p) = -1;
    end
    W = 1/sqrt(2) * W;
end

function T = Threshold(V, e)
    T = zeros(length(V), 1);
    for k = 1:length(V)
       val = V(k);
       if abs(val) < e
           val = 0;
       end
       T(k) = val;
    end
end
