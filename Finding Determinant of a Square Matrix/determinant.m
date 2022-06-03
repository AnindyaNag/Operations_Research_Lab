

function d = determinant(A)
[m,n] = size(A);
if n == 2
    d=(( A(1,1)*A(2,2)) - (A(1,2)*A(2,1)));
else 
    d=0;
    for j = 1:n
        A_temp = A;
        A_temp(1,:) =[];
        A_temp(:, j)=[];
        d = (d+ ((-1)^(1+j))*(A(1,j)* determinant(A_temp)));   
    end   
end
end


