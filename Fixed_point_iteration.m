 clc
clear all

f=@(x)2^x-5*x+2;
err=1;
tol=10^-4;
x0=0;
g=@(x)(2^x+2)/5;
x1=g(x0);
i=0;
while(err>tol)
    i=i+1;
    x1=g(x0);
%     fprintf('x%d=g(%f)\n',i,x0);
    err=abs(x1-x0);
    x0=x1;
end

fprintf('The root is :: %f and the number of iterations are :: %d',x1,i);