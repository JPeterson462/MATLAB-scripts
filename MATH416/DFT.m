function result = DFT(v, N, norm)
    V = zeros(N, 1);
    for k=1:N
       sum = 0;
       for n=0:N-1
           sum = sum + exp(-2 * pi * sqrt(-1) * k * n / N) * v(n);
       end
       V(k) = (1/sqrt(N)) * sum;
       if norm
           V(k) = abs(V(k));
       end
    end
    result = V;
end