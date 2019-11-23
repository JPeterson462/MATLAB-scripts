function t = FiniteTrapezoidalIntegration(F, dh, h)
    t = F(1) / 2;
    if dh == 1
        for k=2:dh:length(F)-1
            t = t + F(k);
        end
    elseif dh == 2
        for k=3:dh:length(F)-1
            t = t + F(k);
        end
    end
    t = t + F(length(F)) / 2;
    t = h * t;
end