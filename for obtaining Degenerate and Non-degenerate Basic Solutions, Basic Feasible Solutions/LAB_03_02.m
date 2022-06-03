%ANINDYA NAG
%UG/02/BTCSE/2018/005
clc;
clearvars;
A = input('Enter the coefficients matrix :  ');
b = input('Enter the right hand side vector :  ');
[m,n] = size(A);
combo = nchoosek(1:n,m);
[m1 n1] = size(combo);
nbs = nchoosek(n,m);
Deg= [];
Non_Deg=[];
B_F_S=[];
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
         disp('Basic solution is:  ');
         x
         if( min(x) >= 0 )
             B_F_S = [B_F_S x];
             disp(' This is a Basic Feasible solution.');
         else
            disp (' This is a Basic Infeasible solution.');
         end
         
         if(y == 0)
              Deg = [Deg x];
              disp('This is Degenerate Basic solution.');
         else
              Non_Deg =[Non_Deg x];        
             disp ('This is Non Degenerate Basic solution.' );
         end
     else
         disp( 'In this case no Basic solution exist.  ' );
     end     
end

disp('D: Degenerate Solution, ND: Non Degenerate Solution, BFS: Basic Feasible Solution');
choice = menu( ' Choose','D',' ND','BFS');

switch choice 
     case 1
          [D1,D2]=size(Deg);
          if (D1 < 1)
              disp('No Degenerate Solution..')
          else
             disp(Deg) ;
          end
     case  2
         [ND1,ND2]=size(Non_Deg);
         if (ND1 < 1)
             disp('No Non Degenerate Solution..')
         else
            disp(Non_Deg) ;
         end
     case 3
          [BFS1,BFS2]=size(B_F_S);
          if (BFS1 < 1)
             disp('No Basic Feasible Solution..')
          else
             disp(B_F_S) ;
          end     
          
 end
