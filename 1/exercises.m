% ################## - 1
% In Matlab, choose a suitable sequence of points in the plane
% [ xi
%  yi ],
%  i = 1, 2, . . . , n
% store them in a matrix A ∈ R 2×n, and plot them to create a recognizable picture;
A = [0 1 1 0 0 0.5 0.7 0.7 0.8 0.8 1 1 0.6 0.6 0.4 0.4; 1 1 0 0 1 1.5 1.3 1.4 1.4 1.2 1 0 0 0.3 0.3 0];

plot(A(1:), A(2:));

% Now take a Householder reflector
% H = I − 2uu*/u*u
% (with a vector u of your choice), compute the points
% H[%xi %yi] and plot them in the same way.
% How is the picture transformed? Note that the orientation of the picture
% is reversed.
R = A;
Q = eye(size(A)(1))

for k = 1:size(A)(1) - 1
  h = householder_reflector(A(k:, k));
  h_size = size(A)(1) - size(h)(1);
  Ii = eye(h_size);
  
  Qi = [Ii : zeros(size(A)(2) - h_size, h_size);
       zeros(size(A)(2) - h_size, h_size) : h];
  Q = Q*Qi;
  R = R * Qi;
end

%Now take any other matrix at your choice M ∈ R2×2
%instead of H, and
%repeat the exercise. Typically M will not be orthogonal (check by computing
%M’*M). How is the picture transformed?
A = rand(2, 2)
M = rand(2, 2)
R = A;
Q = eye(size(A)(1))

for k = 1:size(A)(1) - 1
  h_size = 2
  Ii = eye(h_size)
  
  Qi = [Ii : zeros(size(A)(2) - h_size, h_size);
       zeros(size(A)(2) - h_size, h_size) : M]
  R = R * Qi
end

%The matrix G =
%
%cos α − sin α
%sin α cos α
%
%represents a rotation in the 2 × 2 plane.
%Compute and plot the points G[
%xi
%yi
%]. Is the orientation reversed this time?
%6

plot(G(1,:), G(2,:));

%Compute the eigenvalues of a Householder reflector H = I −
%2
%u∗u
%uu∗ with
%Matlab’s instruction eig. Do this both for u ∈ R
%2 and for larger dimensions.

u = rand(1, 2);
x = rand(1, 4);
Hu = householder_reflector(u);
Hv = householder_reflector(v);
eig(Hu);
eig(Hv);

% Choose a point of the sequence you created in the first exercise, for instance
% A(1:end, 7). Construct a Householder reflector Hˆ that transforms this
% point into a multiple of e1, and plot the points
% Hˆ [xi
%     yi]
% as you did before.
% Check graphically that the chosen point ends up on the x axis
A = [0 1 1 0 0 0.5 0.7 0.7 0.8 0.8 1 1 0.6 0.6 0.4 0.4; 1 1 0 0 1 1.5 1.3 1.4 1.4 1.2 1 0 0 0.3 0.3 0];
A(1:end, 7);
R = A;
Q = eye(size(A)(1))

for k = 1:size(A)(1) - 1
  h = householder_reflector(A(k, k + 1:))
  h_size = size(A)(1) - size(h)(1)
  Ii = eye(h_size)
  
  Qi = [Ii : zeros(size(A)(2) - h_size, h_size);
       zeros(size(A)(2) - h_size, h_size) : h]
  R = R * Qi
end

%. As you know, there are two real Householder reflectors that transform a
%point into a multiple of e1. Repeat the previous exercise with the other
%reflector.

A = [0 1 1 0 0 0.5 0.7 0.7 0.8 0.8 1 1 0.6 0.6 0.4 0.4; 1 1 0 0 1 1.5 1.3 1.4 1.4 1.2 1 0 0 0.3 0.3 0];
A(1:end, 7);
R = A;
Q = eye(size(A)(1))

for k = 1:size(A)(1) - 1
  h = householder_reflector(A(k, k + 1:))
  h_size = size(A)(1) - size(h)(1)
  Ii = eye(h_size)
  
  Qi = [Ii : zeros(size(A)(2) - h_size, h_size);
       zeros(size(A)(2) - h_size, h_size) : h]
  R = R * Qi
end

%Think about the QR factorization of a ‘short fat’ matrix M ∈ R
%m×n,
%m < n. How must the zero pattern of R be?

% To be squared is a prerequisite for QR factorization.

%Let M be a ‘short fat’ matrix M ∈ R
%m×n, and partition it as
%M1 M2
%
%,
%where M1 is square. What is the size of M2, as a function of m and
%n? Show that a QR factorization M = QR is given by Q = Q, R ˆ =
%Rˆ Qˆ∗M2
%
%, where Q, ˆ Rˆ are the QR factors of M1.

% m x (m - n)
%
% 