function rate = CompressionRate(V)
    nonzero = 0;
    for i = 1:length(V)
        if V(i) == 0
            nonzero = nonzero + 1;
        end
    end
    rate = nonzero / length(V);
end