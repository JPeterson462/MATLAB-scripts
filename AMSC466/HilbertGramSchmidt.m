function H = HilbertGramSchmidt(F, dF)
    H = zeros(length(F), 1);
    for k = 2:length(F)
        H(k) = @(x) GramSchmidt(F(k), dF(k), H(:k-1), 
    end
end

function result = L(f, g) 
    result = integral(@(x) f(x).*g(x), -1, 1, 'ArrayValued', true);
end
function result = H(f, g, f_, g_) 
    result = integral(@(x) f(x).*g(x) + f_(x).*g_(x), -1, 1, 'ArrayValued', true);
end

function result = GramSchmidt(f, f_, h, dh, x)
    result = f(x);
    for k = 1:length(h)
        h_ = h(k);
        result = result - (H(f, h(k), f_, dh(k))) / (H(f, f, f_, f_)) * h_(x);
    end
end