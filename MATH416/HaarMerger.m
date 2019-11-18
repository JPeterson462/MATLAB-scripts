function X = HaarMerger(Clist, Dlist)
   q = size(Dlist, 1);
   N = 2^q;
   X = zeros(N, 1);
   offset = 0;
   N = N/2;
   j = 1;
   while N >= 1
       Dn = Dlist{j};
       for k = 1:N
           X(offset + k) = Dn(k);
       end
       offset = offset + N;
       N = N/2;
       j = j + 1;
   end
   C1 = Clist{q};
   X(length(X)) = C1(1);
end