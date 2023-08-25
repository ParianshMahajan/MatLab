 clc
clear all

syms x;
f=@(x)2^x-5*x+2;

p=diff(f,x);
x0=0;
tol=10^-4;
err=1;
while(err>tol)
   x1=x0-(subs(f,x0)/subs(p,x0));
   err=abs(x1-x0);
   x0=x1; 
end

fprintf('The root is :: %f',x1);