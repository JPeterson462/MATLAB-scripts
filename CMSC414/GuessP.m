function p = GuessP(N, t)
    syms k;
    p = double(1 - symprod((N - k) / N, k, 1, t));
end