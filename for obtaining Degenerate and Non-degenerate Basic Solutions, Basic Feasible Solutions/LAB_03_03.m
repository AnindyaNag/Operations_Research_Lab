%ANINDYA NAG
%UG/02/BTCSE/2018/005
clc;
clearvars;
A = input('Enter the coefficients matrix :  ');
b = input('Enter the right hand side vector :  ');
opt_value=0;
[m,n] = size(A);
combo = nchoosek(1:n,m);
[m1 n1] = size(combo);
nbs = nchoosek(n,m);
for i = 1 :nbs
     x = zeros(n,1);
     bas_mat = [ ];
     for j = 1 :n1
        bas_mat = [bas_mat A(:,combo(i,j))];    
     end
     bas_mat;
     y = gauss_elimination(bas_mat,b);
     if( max(y) ~= Inf )
          for j = 1 : n1
              x(combo(i,j),1) = y(j);
          end
          %disp('Basic solution is:  ');
          x;
         if( min(x) >= 0 )
              %disp(' This is a Basic Feasible solution.');
              z= 2*x(1,1) + x(2,1);
              if ( opt_value <= z)
                   opt_value = z;
                   opt_soln =x ;

              end
         end
     
     end
end
fprintf('Optimal Value is: %0.2f\n',opt_value) 
fprintf('Optimal solution is: \n x1=%0.2f \n x2=%0.2f \n x3=%0.2f \n x4=%0.2f \n',opt_soln(1,1),opt_soln(2,1),opt_soln(3,1),opt_soln(4,1))

