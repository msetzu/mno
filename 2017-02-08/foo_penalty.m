function [v,g] = foo_penalty(x)
    global Q c A b eps;
    
    v = 0.5*x'*Q*x + c'*x;
    g = Q*x + c;
    
    for i = 1:size(A,1)
        v = v + (1/eps)*(max(0, A(i,:)*x - b(i))^2);
        g = g + (2/eps)*(max(0, A(i,:)*x - b(i)))*A(i,:)';
    end
end