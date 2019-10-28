function result = AchooseK(a, k)
    product = 1;
    for j=0:k-1
       product = product * (a - j); 
    end
    result = product / factorial(k);
end