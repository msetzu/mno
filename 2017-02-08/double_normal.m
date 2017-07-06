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

psinv = (M'*M)*M';
x = psinv * b;
fprintf('%f\t %f\n', x(1), x(2));
fprintf('%f\n', norm(M*x - b));