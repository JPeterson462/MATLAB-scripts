function V = FiniteDifference(v, e)
    V = zeros(1, length(v));
    for k = 1:length(v)
        V(k) = Threshold(D(v, k, length(v)), e);
    end
end

function V = D(v, k, N)
    V = (v(k) - v(mod(k, N) + 1)) / sqrt(2);
end

function t = Threshold(val, e)
    if abs(val) < e
        t = 0;
    else
        t = val;
    end
end