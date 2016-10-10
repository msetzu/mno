%We first create a random matrix of which we know the exact QR factorization:
%compute
n = 5
R = triu(randn(n)); % random upper triangular R
[Q, dummy_variable] = qr(randn(n)); % qr factorization of n
A = Q*R;

% qr factorization
[Q, R1] = qr(A);

norm(R, R1);


%Create a system with known solution by choosing a random x, a random A
%(of the right size), and computing b = A * x. (As usual, we shall ignore
%the errors in this product.)

n = 100;
x = rand(n, 1);
A = rand(n);
b = A * x;

f = 1e-8 * rand(size(b));
x_e = x + f;

[Q, R] = qr(A);
k_A = cond(A);
lim = k_A * (norm(f) / norm(b));

while norm(x_e - x) / norm(x) < lim
  f = 1e-8 * rand(size(b));
  x_e = x + f;
  lim = k_A * (norm(f) / norm(b));
 end
