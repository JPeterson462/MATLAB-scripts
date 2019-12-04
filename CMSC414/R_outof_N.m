function t = R_outof_N(p, N, r)
   t = nchoosek(N, r) * p.^r * (1 - p).^(N - r); 
end