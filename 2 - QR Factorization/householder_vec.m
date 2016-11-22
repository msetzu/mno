function [h] = householder_vec(v)
    [n, m] = size(v);
    e1 = [1 : zeros(n - 1)];
    H = zeros(n, n);
    u = v - norm(v) * e1
    
    H = eye(n) - (2 / (norm(v)^2)) * (u * ctranspose(u));
    h = H * v;
end