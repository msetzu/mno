function [Q, R] = myQR(A)
    [m, n] = size(A);
    R = A;
    Q = eye(n);
    
    for k = 1 : n - 1
        r = R(k:end, k);
        [~, H] = householder_vec(r);
        Q = Q * ([eye(k) : zeros(k, n - k); zeros(n - k, k) : H]);
        R(k:end, k:end) = H * R(k:end, k:end);
    end
end