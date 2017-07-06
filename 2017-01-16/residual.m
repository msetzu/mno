clear; clc;
rng(0);
format long;

m = 100;
n = 4;
A = randn(100, 4);
B = A'*A;
I = eye(n);
x = I(:,1);
kmax = 200;

for i = 1 : kmax
    x = (A'*A)*x;
    x = (norm(x)^(-1))*x;
end

lambda = (x'*B*x)/(x'*x);
diff = norm((A'*A)*x - lambda*x) / norm(x);

fprintf('v: [%f, %f, %f, ...]\n', x(1), x(2), x(3));
fprintf('lambda: %f\n', lambda);
fprintf('norm ratio: %f\n', diff);