clc
clear all
cost = [-1 3 -2 0 0 0 0];
a=[3 -1 2 1 0 0;-2 4 0 0 1 0;-4 3 8 0 0 1];
b=[7;12;10];
A=[a b];
var=['x1','x2','x3','s1','s2','s3','sol'];
bv=[4 5 6];
zjcj=cost(bv)*A-cost;
simplex_table=[A; zjcj];
array2table(simplex_table,'Variable Name',var);
exit=0;
while exit==0
    if any(zjcj(1:end-1)<0)
        fprintf("Not Optmial\n");
        zc=zjcj(1:end-1);
        [minval,minindex]=min(zc);
        if all(A(:,minindex)<=0)
            fprintf("Unbounded\n");
            exit=1;
        else
            sol=A(:,end);
            column=A(:,minindex);
            for i=1:size(A,1);
                if A(i,minindex)<=0
                    ratio(i)=inf;
                else   
                    ratio(i)=sol(i)./column(i);
                end
            end
            [minrowv,minrowi]=min(ratio);
        end
        bv(minrowi)=minindex;
        k=A(minrowi,minindex);
        A(minrowi,:)=A(minrowi,:)./k;
        for i=1:size(A,1)
            if i~=minrowi
                k=A(i,minindex)
                A(i,:)=A(i,:)-(A(minrowi,:).*k);
            end
        end
        zjcj=cost(bv)*A-cost;
        next_table=[zjcj;A];
        array2table(next_table,'Variablename', Var)
