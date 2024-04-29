clear all
clc
cost = [-1 3 -2 0 0 0];
a=[3 -1 2 1 0 0;-2 4 0 0 1 0;-4 3 8 0 0 1];
b=[7;12;10];
bv=[4 5 6];
nov=size(a,2);
zjcj=cost(bv)*a-cost;
sol=cost(bv)*b;
exit=0;
while exit==0
    if all(zjcj>=0)
        fprintf('\nOptimal Sol Reached with cost %d\n',sol);
        exit=1;
    else
        fprintf('-------------------------------------------------------------------');
        [minvalue,minindex]=min(zjcj);
        check=zeros(1,size(bv,2));
        if all(a(:,minindex))<=0
                fprintf("\nUnbounded!\n");
                exit=1;
        else 
            for i=1:size(bv,2)
                if a(i,minindex)<=0
                check(i)=inf;
                else
                check(i)=b(i)/a(i,minindex);
                end
            end
        end
        [minrowv,minrowi]=min(check);
        leave=bv(minrowi);
        bv(minrowi)=minindex;
        k=a(minrowi,minindex);
        a(minrowi,:)=a(minrowi,:)/k;
        b(minrowi)=b(minrowi)/k;
        for i=1:size(bv,2)
            if i~=minrowi
                k=a(i,minindex);
               a(i,:)=a(i,:)-(a(minrowi,:)*k);
               b(i)=b(i)-(b(minrowi)*k);
            end
        end
        zjcj=cost(bv)*a-cost;
        sol=cost(bv)*b;
        temp=[zjcj,sol];
        temp1=[a,b];
        temp2=[temp;temp1];
        array2table(temp2)
    end
end