clc
clear All

obj=[5 4];                                                              %objectives
cons=[6 4 ; 1 2; -1 1; 0 1;  1 0; 0 1 ];                                %constraints LHS
rhs=[24 ; 6 ; 1 ; 2 ; 0 ; 0]                                            %constraints RHS




%PLOTTING THE GREAPH

x1=0:2:max(rhs);                                                        %start:gap:end
x21=(rhs(1)-cons(1,1)*x1)/cons(1,2);
x22=(rhs(2)-cons(2,1)*x1)/cons(2,2);
x23=(rhs(3)-cons(3,1)*x1)/cons(3,2);
x24=(rhs(4)-cons(4,1)*x1)/cons(4,2);

x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);
x24=max(0,x24);

plot(x1,x21,'b',x1,x22,'g',x1,x23,'r',x1,x24,'y');
title('Plotting a graph');
xlabel('X-Axis');
ylabel('Y-Axis');






%FINDING THE INTERSECTION

sol=[];
for i=1:6
    A1=cons(i,:);
    B1=rhs(i,:);
    
    for j=i+1:6
        A2=cons(j,:);
        B2=rhs(j,:);
        
        A3=[A1;A2];
        B3=[B1;B2];
        X=inv(A3)*B3;
        sol=[sol X];
    end
end






% Finding the feasible solution
% which satisfies the constraints 
% will find those points which satisfies the opposite of constarint and delete em



x1=sol(1,:);
x2=sol(2,:);
Y1=find(6*x1+4*x2-24>0);
sol(:,Y1)=[];

x1=sol(1,:);
x2=sol(2,:);
Y1=find(x1+2*x2>6);
sol(:,Y1)=[];

x1=sol(1,:);
x2=sol(2,:);
Y1=find(-x1+x2>1);
sol(:,Y1)=[];


x1=sol(1,:);
x2=sol(2,:);
Y1=find(x2>2);
sol(:,Y1)=[];


x1=sol(1,:);
x2=sol(2,:);
Y1=find(x1<0);
sol(:,Y1)=[];


x1=sol(1,:);
x2=sol(2,:);
Y1=find(x2<0);
sol(:,Y1)=[];







%Finding OPTIMAL SOLUTION
x1=sol(1,:);
x2=sol(2,:);
var=5*x1+4*x2;         % objective fnxn
[X,Y]=max(var);
optimalSol=sol(:,Y);







