%-------------------------------------------------
% Exercise 17
%
% Find the optimal solution of the quadratic problem
%
% min 0.5*x'*Q*x + c'*x
%     A*x <= b
%
% by means of the penalty method
%-------------------------------------------------

clear all; close all; clc;
global Q c A b eps;

%% Data (Exercise 18)

% the objective function of the penalized problem
% is defined in the file "p_eps.m"

Q = [ 1 0 ;
      0 2 ] ;
c = [ -3 ; -4 ] ;
A = [-2 1 ; 1 1 ; 0 -1 ];
b = [ 0 ; 4 ; 0 ];

%% Algorithm

fprintf('Penalty method\n\n');
fprintf('iter \t epsilon \t x(1) \t\t x(2) \t\t min(b-Ax) \n\n');
iter = 0;
eps = 5 ;
tau = 0.5 ;

options = optimoptions('fminunc','GradObj','on',...
    'Algorithm','quasi-newton','Display','off');

while true
    x = fminunc('p_eps',[0;0],options);
    unfeas = min(b-A*x); % x \in \Omega iff Ax <= b, Ax - b <= 0, b - Ax >= 0
    fprintf('%1.0f \t %1.2e \t %1.6f \t %1.6f \t %1.2e\n',iter,eps,x(1),x(2),unfeas);
    if unfeas > -1e-3 % -1e-3 is the tollerance for x being in the feasible region or not
        break
    else
        eps = eps*tau ;
        iter = iter + 1 ;
    end
end
