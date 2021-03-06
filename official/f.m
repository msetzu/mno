% v = value
% g = Gradient
% H = Hessian
function [g, H] = f(x)

v = 2*x(1)^4 + 3*x(2)^4 + 2*x(1)^2 + 4*x(2)^2 + x(1)*x(2) - 3*x(1) - 2*x(2) ;

g = [ 8*x(1)^3 + 4*x(1) + x(2) - 3 ; 12*x(2)^3 + 8*x(2) + x(1) - 2 ] ;

H = [4+24*x(1)^2  1 ;
     1  8+36*x(2)^2] ;

end
