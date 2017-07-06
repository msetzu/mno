clear all; close all; clc;

%% Direct-search method

%% Data (Exercise 9)

% the objective function is defined in the file "f.m"

x0 = [ 0 ; 0 ];
t0 = 5 ;
beta = 0.5 ;
epsilon = 1e-5 ;
% D = [ 1 0 -1 0 ;
%       0 1 0 -1 ] ;
D = [ 1 0 -1 ;
      0 1 -1 ] ;

%% Algorithm

fprintf('Direct-search method\n\n');
fprintf('iter \t x(1) \t\t x(2) \t\t f(x) \t\t t\n\n');

iter = 0 ;
x = x0 ;
v = f(x) ;

% step size
t = t0 ;

fprintf('%1.0f \t %1.6f \t %1.6f \t %1.6f \t %1.6f\n',iter,x(1),x(2),v,t);

while t > epsilon
    newv = v ;
    i = 0 ;
    while (newv >= v) && (i < size(D,2))
        i = i + 1 ;
        newx = x+t*D(:,i) ;
        newv = f(newx) ;
    end
    if newv < v %succesful iteration
        x = newx ;
        v = newv ;
        fprintf('%1.0f \t %1.6f \t %1.6f \t %1.6f \t %1.6f\n',iter,x(1),x(2),v,t);
    else % failed iteration
        t = beta*t ;
    end
    iter = iter + 1 ;
end
