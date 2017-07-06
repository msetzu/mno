clear; clc;
rng(0);
format long;

m = 100;
n = 4;
A = randn(100, 4);
B = A'*A;
I = eye(n);
x = I(:,1);
kmax = 15;
mu = 100;
[Q1, R1] = qr(A,0);
M = inv(R1*R1' - mu*eye(n));

for i = 1 : kmax
    x = M*x;
    x = (norm(x)^(-1))*x;
end

lambda = (x'*B*x)/(x'*x);

fprintf('v: [%f, %f, %f, ...]\n', x(1), x(2), x(3));
fprintf('lambda: %f\n', lambda);