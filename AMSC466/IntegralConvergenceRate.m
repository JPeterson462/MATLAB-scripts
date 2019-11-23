function r = IntegralConvergenceRate(f, I, n, a, b)
    I_n = I(f, n, a, b);
    I_2n = I(f, 2 * n, a, b);
    I_4n = I(f, 4 * n, a, b);
    r = (I_2n - I_n) / (I_4n - I_2n);
end