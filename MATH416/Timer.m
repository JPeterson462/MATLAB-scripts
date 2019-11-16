function Timer(Fourier1, Fourier2, N)
   T1 = zeros(length(N), 1);
   T2 = zeros(length(N), 1);
   for i = 1:length(N)
      T1(i) = Time(Fourier1, N(i));
      T2(i) = Time(Fourier2, N(i));
   end
   plot(N, T1, 'r', N, T2, 'g');
end

function t = Time(Fourier, n)
    M = randi([-50 50], n, n);
    t = timeit(@() Fourier(M));    
end