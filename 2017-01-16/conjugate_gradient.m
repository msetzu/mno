clear; clc;
Q = [2 0 -1 0;
    0 3 0 -2;
    -1 0 2 0;
    0 -2 0 3];
c = [1; 2; 3; 4];
tol = 1e-6;
x0 = [0; 0; 0; 0];
x = x0;
i = 0;

while true
    v = 0.5*x'*Q*x + c'*x;
    g = Q*x + c;
    
    if norm(g) <= tol
        break;
    end
    
    if i == 0
        d = -g;
        g_prev = g;
        d_prev = d;
    else
        beta = norm(g)^2 / norm(g_prev)^2;
        d = -g + beta * d_prev;
        d_prev = d;
        g_prev = g;
    end
    
    t = norm(g)^2 / (d'*Q*d);
    x = x + t*d;
    i = i + 1;
    fprintf('i: %d\tnorm:%f\t\t %f\t %f\t %f\t %f\t \n', i, norm(g), x(1), x(2), x(3), x(4));
end