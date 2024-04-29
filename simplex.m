clear all
cost=[2 -5 0 0 0];
a=[7 4 1 0; -3 5 0 1];
b=[12; 15];
A=[a b];
Var={'x1' , 'x2' , 's1' , 's2' , 'sol'}
bv=[3 4];
zjcj=cost(bv)*A-cost;
simplex_table=[A; zjcj]
array2table(simplex_table,'Variablename',Var)
Run=true;
while Run
    if any(zjcj(1:end-1)<0)
        fprintf('The current BFS is not optimal \n');
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
                k=A(i,minindex);
                A(i,:)=A(i,:)-(k.*A(minrowi,:));
            end
        end
        zjcj=cost(bv)*A-cost;
        next_table=[zjcj;A];
        array2table(next_table,'Variablename', Var)
    else
        Run=false;
        fprintf('The final optimal value is %f \n' , zjcj(end));
    end
end