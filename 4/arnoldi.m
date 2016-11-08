function [Q, Hhat] = arnoldi(A, b, m)
% Arnoldi process to produce an orthonormal basis for a Krylov subspace.
%
% [Q, Hhat] = arnoldi(A, b, m)
%
% Returns a n x (m-1) matrix Q with orthonormal columns, and a (m+1) x m
% matrix H which is "extended upper Hessenberg" such that A*Q(:,1:m) =
% Q*Hhat.

n = length(A);
Hhat = zeros(m+1, m);
Q = zeros(n, m+1);
Q(1:end, 1) = b / norm(b);
for k = 1:m
    r = A * Q(:,k);
    for j = 1:k
        Hhat(j, k) = Q(:,j)'*r;
        r = r - Q(:,j) * Hhat(j, k);
    end
    Hhat(k+1, k) = norm(r);
    Q(1:end, k+1) = r / Hhat(k+1, k);
end
