function result = Maximizer(X, f)
    Y_ = zeros(length(X), 1);
    Y = Y_(:,1);
    for t=1:length(X)
        Y(t) = f(X(t));
    end
    result = Y;
end