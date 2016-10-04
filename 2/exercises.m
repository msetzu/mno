%We first create a random matrix of which we know the exact QR factorization:
%compute
n = 5
R = triu(randn(n)); % random upper triangular R
[Q, dummy_variable] = qr(randn(n)); % qr factorization of n
A = Q*R;

% qr factorization
[Q, R1] = qr(A);

norm(R, R1)