function s = Sum(f, x, N)
    s = f(x(0));
    for i = 1:N
       s = s + f(x(i)); 
    end
end