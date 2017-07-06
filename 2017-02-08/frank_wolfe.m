clear; clc;
Q = [2 0 0.5 0; 0 4 0 0.5; 0.5 0 6 0; 0 0.5 0 8];
c = [-4; -3; -2; -1];
x0 = [0; 0; 0; 0];
x = x0;
tol = 1e-3;
A = [1 1 1 1;
    -1 0 0 0;
    0 -1 0 0;
    0 0 -1 0;
    0 0 0 -1];
b = [2;
    0;
    0;
    0;
    0];
i = 0;

while true
    g = Q*x + c;
    y = linprog(g, A, b, [], [], [], [], [], optimset('Display', 'off'));
    d = y - x;
    
    if -g' * d < tol
        break;
    end
    
    t = min(1, (-g'*d)/(d'*Q*d));
    x = x + t*d;
    i = i + 1;
    fprintf('i: %d\t%f\t %f\t %f\t %f', i, x(1), x(2), x(3), x(4));
end