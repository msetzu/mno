clear all; close all; clc;

%% Newton method with inexact line search

%% Exericse 8

% the objective function is defined in the file "f.m"

alpha = 0.1 ;
gamma = 0.9 ;
tbar = 1 ;
x0 = [ 0 ; 0 ] ;
tol = 1e-3 ;

%% Algorithm

fprintf('Newton method with inexact line search \n\n');
fprintf('iter \t x(1) \t\t x(2) \t\t f(x) \t\t ||grad f(x)||\n\n');

iter = 0 ;
x = x0;

while true
    [v, g, H] = f(x);
    fprintf('%1.0f \t %1.6f \t %1.6f \t %1.6f \t %1.7f\n',iter,x(1),x(2),v,norm(g));
    
    % stopping criterion
    if norm(g) < tol
        break
    end
    
    % search direction
    d = -H\g; %H*d = -g
    
    % inexact line search
    t = tbar ;
    while f(x+t*d) > v + alpha*g'*d*t
        t = gamma*t ;
    end
    
    x = x + t*d ;
    iter = iter + 1 ;
end
