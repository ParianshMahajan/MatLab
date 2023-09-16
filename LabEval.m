Method 1: Bisection Method

clear all
clc
% Writing the inputs
a = input('Enter the value of a: ');
b = input('Enter the value of b: ');
f = @(x) x^3 - 7*x^2 + 14*x - 6;
tol = 10^-2;
if f(a)*f(b) > 0
 fprintf('Wrong interval of a and b \n')
 a = input('Enter the value of a: ');
 b = input('Enter the value of b: ');
end
% This is the first iteration
err = abs(b-a);
c = (a + b)/2;
itr = 1;
while err > tol
 if f(a)*f(c) < 0
 b = c;
 else
 a = c;
 end
 c = (a+b)/2;
 err = abs(b-a);
 itr = itr + 1;
end
fprintf('Root = %f \n No. of iteration = %d', c, itr);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------



Method 2: Fixed point iteration method
clear all
clc
% Writing the inputs
x0 = input('Enter initial guess: ');
f = @(x) x - cos(x);
g = @(x) cos(x);
tol = 10^-2;
syms x %For treating x as a variable in rest of the program
h(x) = diff(g(x));
if abs(h(x0)) > 1
 fprintf('Wrong choice of g(x)');
 return;
end
% This is the first iteration
x1 = g(x0);
err = abs(x1-x0);
itr = 1;
while err > tol
 x0 = x1;
 x1 = g(x0);
 err = abs(x1-x0);
 itr = itr + 1;
end
fprintf('Root = %f \n No. of iteration = %d', x1, itr);





---------------------------------------------------------------------------------------------------------------------------------------------------------------------



Method 3: Newton’s Method
clear all
clc
% Writing the inputs
x0 = input('Enter initial guess: ');
f = @(x) x-cos(x);
tol = 10^-2;
syms x %For treating x as a variable in rest of the program
h(x) = diff(f(x));
if abs(h(x0)) == 0
 fprintf('Newton method failed');
 return;
end
% This is the first iteration
x1 = x0 -(f(x0)/h(x0));
err = abs(x1-x0);
itr = 1;
while err > tol
 x0 = x1;
 x1 = x0 -(f(x0)/h(x0));
 err = abs(x1-x0);
 itr = itr + 1;
end
fprintf('Root = %f \n No. of iteration = %d', x1, itr);




---------------------------------------------------------------------------------------------------------------------------------------------------------------------





Method 4: Secant Method
clear all
clc
% Writing the inputs
x0 = input('Enter initial guess x0: ');
x1 = input('Enter initial guess x1: ');
f = @(x) x-cos(x);
tol = 10^-2;
if f(x1) == f(x0)
 fprintf('Newton method failed');
 return;
end
% This is the first iteration
x2 = x1 - ( (x1-x0)/( f(x1)-f(x0) ) ) * f(x1);
err = abs(x2-x1);
itr = 1;
while err > tol
 x0 = x1;
 x1 = x2;
 x2 = x1 - ( (x1-x0)/( f(x1)-f(x0) ) ) * f(x1);
 err = abs(x2-x1);
 itr = itr + 1;
end
fprintf('Root = %f \n No. of iteration = %d', x2, itr);