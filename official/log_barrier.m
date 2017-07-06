%-------------------------------------------------
% Exercise 19
%
% Find the optimal solution of the quadratic problem
%
% min 0.5*x'*Q*x + c'*x
%     A*x <= b
%
% by means of the logarithmic barrier method
%-------------------------------------------------

clear; close all; clc;
global Q c A b eps;

%% Data (Exercise 20)

% the objective function of the unconstrained problem
% is defined in the file "f_logbarrier.m"

Q = [ 1 0 ;
    0 2 ] ;
c = [ -3 ; -4 ] ;
A = [-2 1 ; 1 1 ; 0 -1 ];
b = [ 0 ; 4 ; 0 ];
x = [ 1 ; 1 ];

%% Algorithm

eps = 1 ;
tau = 0.5 ;
m = size(A,1) ;

options = optimoptions('fminunc','GradObj','on',...
    'Algorithm','quasi-newton','Display','off');

fprintf('Logarithmic barrier method\n\n');
fprintf('eps \t\t x(1) \t\t x(2) \t\t gap \n\n');

while true
    x = fminunc('f_logbarrier',[1;1],options);
    %     x = fminsearch('f_logbarrier',[1;1],optimset('Display','off'));
    gap = m*eps;
    fprintf('%1.2e \t %1.6f \t %1.6f \t %1.2e\n',eps,x(1),x(2),gap);
    if gap < 1e-3
        break
    else
        eps = eps*tau;
    end
end
