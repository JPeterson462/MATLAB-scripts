function V = Threshold(v, e)
    V = zeros(length(v));
    for k = 1:length(v)
        if abs(v(k)) < e
            V(k) = 0;
        else
            V(k) = v(k);
        end
    end
end