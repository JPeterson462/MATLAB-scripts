function result = Error(F, Ft)
    result = @(x) abs(F(x) - Ft(x));
end