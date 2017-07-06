clear all; close all; clc;

%% Exercise 7

Q = [6     0    -4     0
     0     6     0    -4
    -4     0     6     0
     0    -4     0     6];

c = [ 1 ; -1 ; 2 ; -3 ];

x0 = [ 0 ; 0 ; 0 ; 0 ] ;
tol = 1e-6 ;

%% Conjugate Gradient method

fprintf('Conjugate Gradient method\n\n');
fprintf('iter \t f(x) \t\t ||grad f(x)||\n\n');

iter = 0 ;

% starting point
x = x0 ;

while true
    v = 0.5*x'*Q*x + c'*x;
    g = Q*x + c ;
    fprintf('%1.0f \t %1.6f \t %1.7f\n',iter,v,norm(g));

    % stopping criterion
    if norm(g) < tol
        break
    end

    %   search direction
    if iter == 0
        d = -g ;
    else
        d = -g + norm(g)^2*d_prev/(norm(g_prev)^2) ;
    end

    %   step size
    t = norm(g)^2/(d'*Q*d) ;

    %   new point
    x = x + t*d;
    d_prev = d ;
    g_prev = g ;
    iter = iter + 1 ;
end
