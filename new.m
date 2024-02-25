clc 
clear all

obj=[3 4 0 0];
cons=[1 1 1 0; 2 1 0 1];
rhs=[450;600];

n=size(cons,2);
m=size(cons,1);

if n>m
    ncm=nchoosek(n,m);
    pairs=nchoosek(1:n,m);
    sol=[];
    
    for i=1:ncm
        y=zeros(1,n);
        x=cons(:,pairs(i,:))\rhs;
        if all (x>=0 & x~=inf & x~=-inf)
            y(:,pairs(i,:))=x;
            sol=[sol; y];
        end
    end



else
    error('nCm does not exists');
end

ans=[];
for i=1:size(sol,2)
    q=0;
    for j=i:size(sol,2)
        q=q+obj(1,j)*sol(i,j);
    end
    ans=[ans;q];
end
max(ans)


