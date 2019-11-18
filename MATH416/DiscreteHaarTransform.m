function [Clist, Dlist] = DiscreteHaarTransform(x, e)
    L = length(x);
    X = x;
    Clist = cell(log2(L), 1);
    Dlist = cell(log2(L), 1);
    Ci = 1;
    Di = 1;
    while L > 1
        X = CreateW(L) * X;
        [Cn, Dn] = GetPair(X, e);
        Clist{Ci} = Cn;
        Dlist{Di} = Dn;
        X = Cn;
        Ci = Ci + 1;
        Di = Di + 1;
        L = L/2;
    end
end

function [C, D] = GetPair(X, e)
    C = X(1:length(X)/2);
    D = X(length(X)/2+1:length(X));
    C = ThresholdVec(C, e);
    D = ThresholdVec(D, e);
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

function T = ThresholdVec(Val, e)
    T = zeros(size(Val));
    for k = 1:length(Val)
       T(k) = Threshold(Val(k), e); 
    end
end

function t = Threshold(val, e)
    if abs(val) < e
        t = 0;
    else
        t = val;
    end
end
