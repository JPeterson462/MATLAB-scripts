function result = HermiteFejerInterpolant(X, F, dF)
    result = @(x) H(X, F, dF, x);
end

function result = H(X, F, dF, x)
    sum = 0;
    N = length(X);
    for k=1:N
        sum = sum + F(k) * Ck(X, k, x) + dF(k) * Dk(X, k, x);
    end
    result = sum;
end

function result = Ck(X, k, x)
    L = Lk(X, k, x);
    dL = dLk(X, k, X(k));
    result = (1 - 2 * (x - X(k)) * dL) * L * L;
end
function result = Dk(X, k, x)
    L = Lk(X, k, x);
    result = (x - X(k)) * L * L;
end

function result = dLk(X, k, x)
    N = length(X);
    sum = 0;
    for l=1:N
       if l ~= k
            product = 1 / (X(k) - X(l));
            for m=1:N
                if m ~= k && m ~= l
                    product = product * (x - X(m)) / (X(k) - X(m));
                end
            end
            sum = sum + product;
       end
    end
    result = sum;
end

function result = Lk(X, k, x)
    product = 1;
    N = length(X);
    for j=1:N
        if j ~= k
            product = product * (x - X(j)) / (X(k) - X(j));
        end
    end
    result = product;
end