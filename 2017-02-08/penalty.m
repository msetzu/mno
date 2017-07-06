clear all; clc;
global Q c A b eps tau;

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
eps = 1;
tau = 0.5;
options = optimoptions('fminunc','GradObj','on','Algorithm', 'quasi-newton','Display','off');

while true
    x = fminunc('foo_penalty', x0, options);
    distance = min(b - A*x);
    
    if distance > -tol
        break;
    end
    
    eps = tau*eps;
    i = i + 1;
    fprintf('i: %d\t%f\t %f\t %f\t %f\n', i, x(1), x(2), x(3), x(4));
end