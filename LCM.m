clc;
cost=[8 1 3 5 6;2 8 4 7 8;3 1 5 2 9;5 3 1 6 9];
a=[6 12 18 24];
b=[17 14 15 16 10];

if(sum(a)==sum(b))
    fprintf('given problem is balanced\n');
else
    fprintf('given problem is unbalanced\n');
    if(sum(a)<sum(b))
        cost(end+1,:)=zeros(1,size(b,2));
        a(end+1)=sum(b)-sum(a);
    else 
        cost(:,end+1)=zeros(size(a,2),1);
        b(end+1)=sum(a)-sum(b);
    end
end

Icost=cost;
X=zeros(size(cost));
m=size(cost,1);
n=size(cost,2);
bfs=m+n-1;

for i=1:m
    for j=1:n
        hh=min(min(cost));
        [row,col]=find(hh==cost)
        x11=min(a(row),b(col));
        [val,idx]=max(x11);
        ii=row(idx);
        jj=col(idx);
        y11=min(a(ii),b(jj));
        X(ii,jj)=y11;
        a(ii)=a(ii)-y11;
        b(jj)=b(jj)-y11;
        cost(ii,jj)=10000;  
    end
end

fprintf('initial bfs = \n');
IBFS=array2table(X);
disp(IBFS)

total=length(nonzeros(X));
if total==bfs
    fprintf('non degenerate solution\n');
else
    fprintf('degenerate solution\n');
end
initial_cost=sum(sum(Icost.*X));
fprintf('the minimum cost of initial bfs bny LeasT Cost Method is= %d',initial_cost);
