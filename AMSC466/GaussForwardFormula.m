function result = GaussForwardFormula(f, x0, N, a)
    sum = f(x0);
    for j=1:N-1
        disp(a + floor((j - 1) * 0.5));
        sum = sum + AchooseK(a + floor((j - 1) * 0.5), j) * DeltaK(f, j);
    end
    result = sum;
end