function X = DHT(x)
    N = length(x);
    X = zeros(N, 1);
    for n = 0:N-1
       sum = 0;
       for k = 0:N-1
          sum = sum + x(k + 1) * (cos(2 * pi * n * k / N) + sin(2 * pi * n * k / N)); 
       end
       X(n + 1) = sum;
    end
end