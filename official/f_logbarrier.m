function [v,g] = f_logbarrier(x)

global Q c A b eps

v = 0.5*x'*Q*x + c'*x ;
g = Q*x + c ;

% nabla(Ax - b) = A // x is removed since linear, b since constant
for i = 1 : length(b)
    v = v - eps*log(b(i)-A(i,:)*x) ;
    g = g + (eps/(b(i)-A(i,:)*x))*A(i,:)' ;
end

end
