clear; clc;
m = 10;
n = 6;

A = rand(m,n);
x = rand(n,1);
kmax = 10;
B = A*ctranspose(A);

for i = 1 : kmax
    x = (A'*A)*x;
    x = (norm(x)^(-1))*x;
end
fprintf('x: [%f, %f, %f, %f, %f, %f]\n', x(1), x(2), x(3), x(4), x(5), x(6));