clear; clc;
syms x1 x2 l1 l2;
Q = 2 * eye(2);
c = [0; -4];

eq0 = 2*x1 + 2*l1*x1;
eq1 = 2*x2 - 4 -l1 +l2;
eq2 = l1*(x1^2 - x2);
eq3 = l2*(x2 -1);

res = solve([eq0 eq1 eq2 eq3], [x1 x2 l1 l2]);
k = size(res.l1,1);

for i = 1:k
    if res.l1(i) >= 0 && res.l2(i) >= 0 && res.x1(i)^2 - res.x2(i) <= 0 && res.x2(i) - 1 <= 0
        fprintf('%f\t %f\t |lambda: %f\t %f\n', res.x1(i), res.x2(i), res.l1(i), res.l2(i));
    end
end

syms x1 x2 l1 l2;
foo = x1^2 + x2^2 - 4*x2;
g1 = x1^2 - x2;
g2 = x2 - 1;

fprintf('Lagrangian\n');
lagrangian = foo + l1*g1 + l2*g2
fprintf('Gradient of Lagrangian\n');
gr_lagrangian = gradient(lagrangian, [x1 x2])
min_x_lagrangian = solve([gr_lagrangian(1) gr_lagrangian(2)], [x1 x2]);
fprintf('Minimum x of the Lagrangian\n');
min_x_lagrangian.x1
min_x_lagrangian.x2
fprintf('Lagrangian relaxation\n');
lagrangian_relaxation = subs(lagrangian, [x1 x2], [min_x_lagrangian.x1 min_x_lagrangian.x2])