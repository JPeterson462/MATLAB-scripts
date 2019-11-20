function V = IterativeSum(f, v, K, e)
    V = v;
    for k = 1:K
       V = f(V, e); 
    end
end