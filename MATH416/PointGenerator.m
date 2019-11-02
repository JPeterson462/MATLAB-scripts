function result = PointGenerator(f, X)
    Y = zeros(length(X), 1);
    for i=1:length(X)
        Y(i) = f(X(i));
    end
    result = Y;
end