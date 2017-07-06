%-------------------------------------------------
% Exercise 14
%
% Find the optimal solution of the quadratic problem
%
% min 0.5*x'*Q*x + c'*x9+
%     A*x <= b
%
% by means of the Frank-Wolfe method
%-------------------------------------------------

clear all; close all; clc; format;
% hold on ;

%% data (Exercise 15)

Q = [ 1 0 ;
      0 2 ] ;
c = [ -3 ; -4 ] ;
A = [-2 1 ; 1 1 ; 0 -1 ];
b = [ 0 ; 4 ; 0 ];

x = [ 0 ; 0];

%% Algorithm

fprintf('Frank-Wolfe method\n\n');
fprintf('iter \t x(1) \t\t x(2) \t\t y(1) \t\t y(2) \t\t gap \n\n');

iter = 0;
x;

while true
    g = Q*x + c;
    y = linprog(g,A,b,[],[],[],[],[],optimset('Display','off'));
    d = y-x;
    gap = -g'*d;
    fprintf('%1.0f \t %1.6f \t %1.6f \t %1.6f \t %1.6f \t %1.6f\n',iter,x(1),x(2),y(1),y(2),gap);
    if gap < 1e-3
        break
    else
        % exact line search
        t = min(1,(-g'*d)/(d'*Q*d));

        % predetermined step size
        %t = 1/(iter+1);

        iter = iter + 1 ;
        x = x + t*d ;
    end
end
