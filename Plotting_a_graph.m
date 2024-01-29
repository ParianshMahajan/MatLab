clc
clear All

obj=[5 4];                                                              %objectives
cons=[6 4 ; 1 2; -1 1; 0 1;  1 0; 0 1 ];                                %constraints LHS
rhs=[24 ; 6 ; 1 ; 2 ; 0 ; 0]                                            %constraints RHS



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
