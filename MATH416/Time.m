function t = Time(Fourier, n)
    M = randi([-50 50], n, n);
    t = timeit(@() Fourier(M));    
end