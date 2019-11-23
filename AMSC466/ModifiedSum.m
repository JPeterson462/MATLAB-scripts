function s = ModifiedSum(f, x, N)
   s = f(x(0)) / 2;
   for i = 1:N-1
      s = s + f(x(i)); 
   end
   s = s + f(x(N)) / 2;
end