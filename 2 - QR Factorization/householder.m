function [H] = householder(v)
n = size(v)(1);
e1 = [1 : zeroes(n - 1)];
H = zeroes(n, n);
u = x - norm(x) * e1;

H = I - 2 / (norm(v)^2);
end