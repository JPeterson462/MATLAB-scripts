function t = R_ormore_outof_N(p, N, r)
    t = 0;
    for k = r:N
        t = t + R_outof_N(p, N, k);
    end
end