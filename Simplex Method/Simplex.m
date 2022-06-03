clc;
clear all;
%This program is for solving problems on the simplex method 
%where the problem is maximization type and all the constraints are less than equal (<= ) type.
m=input('How many constraints?\n');
n=input('How many variables?\n');
c_nb=input('Enter the cost vector: ');
for j=1:n
    %c_nb(j,1)=input('');
    xnb_ind(1,j)=j;
    x(j,1)=0;
end
b=input('Enter the right hand side vector: ');
for i=1:m
    %b(i,1)=input('');
    c_b(i,1)=0;
    xb_ind(i,1)=n+i;
    x(n+i,1)=0;
end
a=input('Enter the coefficient matrix: ');
% for i=1:m
%     for j=1:n
%         a(i,j)=input('');
%     end
% end
x=zeros(n+m,1);
for j=1:n
    indicator(1,j)=c_b'*a(:,j)-c_nb(j,1);
end
[ind,KC]=min(indicator);
tab_old=[a b; indicator c_b'*b];
while(ind < 0)
for i=1:m
    if (tab_old(i,KC)>0)
        ratio(i,1)=b(i,1)/tab_old(i,KC);
    else
        ratio(i,1)=10^6;
    end
end
[min_ratio,KR]=min(ratio);
temp=xb_ind(KR,1);
xb_ind(KR,1)=xnb_ind(1,KC);
xnb_ind(1,KC)=temp;
if (min_ratio==10^6)
    disp('Problem is unbounded');
else
    KE=tab_old(KR,KC);
    for i=1:m+1
        for j=1:n+1
            if (i==KR && j==KC)
                tab_new(i,j)=1/KE;
            elseif(i==KR)
                tab_new(i,j)=tab_old(i,j)/KE;
            elseif(j==KC)
                tab_new(i,j)=-tab_old(i,j)/KE;
            else
               tab_new(i,j)=(KE*tab_old(i,j)-tab_old(KR,j)*tab_old(i,KC))/KE;
            end
        end
    end
end
for i=1:m
    x(xb_ind(i,1),1)=tab_new(i,n+1);
end
for j=1:n
    x(xnb_ind(1,j),1)=tab_new(m+1,j);
end
tab_new;
indicator=tab_new(m+1,:);
[ind,KC]=min(indicator);
tab_old = tab_new;
end
x
    