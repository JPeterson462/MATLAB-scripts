function result = DeltaK(f, k)
    sum = 0;
    m = floor(k / 2);
    for j=0:k
       sum = sum + (-1)^j * nchoosek(k, j) * f(m - j);
    end
    result = sum;
end