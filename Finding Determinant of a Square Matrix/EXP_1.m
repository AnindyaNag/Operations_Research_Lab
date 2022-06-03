

A= input('Enter the matrix  :  ');
[m,n] = size(A);
if ( m ~= n)
    disp('Determinant does not exist....');
else
    d= determinant(A);
    fprintf('Determinant of the matrix is  =  %f  ',d);
end
 



