%ANINDYA NAG
%UG/02/BTCSE/2018/005

function x = gauss_elimination(A,b)
  [m,n] = size(A);
  if ( m == n)
      Aug =[A b];
      for k = 1 : (n-1)
          [big ip] = max(abs(Aug(k:m,k)));
          ipr = ip +k-1 ;
            if (ipr ~= k)
               Aug([k ipr],:) =Aug([ipr k],:);
            end
            for i = (k +1) : n
                factor = Aug(i,k)/Aug(k,k);
                for j=1 : (n+1)
                   Aug(i,j) =(Aug(i,j)-(factor*Aug(k,j)));
                end

            end
      end
      x = [];
      x(n) = Aug(n,n+1)/ Aug(n,n);

      for i=(n-1):-1: 1
          Sum = 0;
          for j = n:-1:(i+1)
              Sum = Sum + Aug(i,j)*x(j) ;
          end
         x(i) =( Aug(i,n+1) -Sum)/Aug(i,i);
      end
  end

end
