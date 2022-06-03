
clc;
A = input('Enter the coefficients matrix :  ');
b = input('Enter the right hand side vector :  ');
[m,n] = size(A);
combo = nchoosek(1:n,m);
[m1 n1] = size(combo);
nbs = nchoosek(n,m);
for i = 1 : nbs
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
            disp(' This is a Basic Feasible solution.');
        else
            disp (' This is a Basic Infeasible solution.');
        end
        if(y == 0)
            disp('This is Degenerate Basic solution.');
        else
            disp ('This is Non Degenerate Basic solution.' );
        end
    else
        disp ( 'In this case no Basic solution exist . ' );
    end     
end


