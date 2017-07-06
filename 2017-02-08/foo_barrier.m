function [v,g] = foo_barrier(x)
    global Q c A b eps;
    
    v = 0.5*x'*Q*x + c'*x;
    g = Q*x + c;
    
    for i = 1:size(A,1)
        v = v - eps * log(b(i) - A(i,:)*x);
        g = g + eps*(1/b(i) - A(i,:)*x)*(A(i,:)');
    end
end