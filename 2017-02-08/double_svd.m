clear; clc;
format compact

syms x;
m = 6;
n = 2;
A = [1e4 1e4;
    1e4 9999;
    1e4 9999];
M = [A;A];
b = [1e3;
    999;
    1e3;
    -1e3;
    -999
    -1e3];

[U, S, V] = svd(M,0);
c = U'*b;
y = zeros(1, n);

for i = 1:n
    y(i) = (c(i,1) / S(i,i));
end

x = V*y';
for i = 1:n
    fprintf('%f\t', x(i));
end
fprintf('\n');