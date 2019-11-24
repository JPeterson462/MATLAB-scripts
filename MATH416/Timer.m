function Timer(N)
   T1 = zeros(length(N), 1);
   T2 = zeros(length(N), 1);
   T3 = zeros(length(N), 1);
   for i = 1:length(N)
      T1(i) = Time(@(M) matDFT2(M), N(i));
      T2(i) = Time(@(M) fastMatFFT2(M), N(i));
      T3(i) = Time(@(M) fft2(M), N(i));
   end
   plot(N, T1, 'r', N, T2, 'g', N, T3, 'b');
end