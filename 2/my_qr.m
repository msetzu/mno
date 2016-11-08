function [Q, R] = my_qr(A)
% QR factorization of A
%
% [Q, R] = my_qr(A)
%
% Returns a square unitary Q and an upper triangular R with
% size(R)==size(A), such that A = Q*R.

R = A;
[m, n] = size(R);

Q = eye(m);

% Border case: if we arrive at the point where H has size 1x1, then we can stop
% without applying the last reflector. This happens only if n>=m, though.
% This is why the loop stops at min(n, m-1). If you only 
% care about the case of square A, then you can just use n-1 or m-1 here.
% Stopping at m (or n) is not wrong, but produces Q and R which have a few
% different signs.
for k = 1:min(n, m-1)
    [u, nx] = householder(R(k:end, k)); % returns normalized u, with our implementation

    % We already know what the transformation does to the kth column,
    % so we write it directly instead of recomputing it numerically.
    % This also ensures that the entries below the diagonal of R are truly 0.
    R(k, k) = nx;
    R(k+1:end, k) = 0;
    
    % Forming H_k or Q_k explicitly and multiplying would have a higher
    % cost (n^3 per iteration instead of n^2), so instead we use
    % the identity (I-2*u*u')*M = M - (2*u)*(u'*M).
    % Be careful about the parentheses: the default order (2*u*u')*R(k:end,
    % k+1:end) would have higher complexity.
    R(k:end, k+1:end) = R(k:end, k+1:end) - (2*u) * (u'*R(k:end, k+1:end)); 

    % we accumulate transformations to build Q: we start from Q=I, and at each
    % step we post-multiply it Q = Q * Q_k
    % note that Q_k = Q_k', so we do not need the transpose.
    % Again, forming Q_k and computing explicitly Q*Q_k
    % would have higher complexity, so we compute the product implicitly.
    % Be careful about the indices: this transformation acts only on the 
    % last k:end columns of Q, but on all rows.
    Q(1:end, k:end) = Q(1:end, k:end) - (Q(1:end, k:end)*u) * (2*u');
end
