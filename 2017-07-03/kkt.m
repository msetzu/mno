clear; clc;
syms x1 x2 l1 l2;

eq0 = -8*x1 + 8 + 2*l1*x1 - 2*l1;
eq1 = -2*x2 -2 + 2*l2*x2 - 2*l2;
eq2 = l1*(x1^2 -2*x1);
eq3 = l2*(x2^2-2*x2);

res = solve([eq0, eq1, eq2, eq3]);
k = size(res.l1, 1);

for i = 1:k
    x1 = res.x1(i);
    x2 = res.x2(i);
    l1 = res.l1(i);
    l2 = res.l2(i);
    
    if l1 >= 0 && l2 >= 0 && x1^2 - 2*x1 <= 0 && x2^2 - 2*x2 <= 0
        fprintf('Minimum: %f\t %f\t %f\t %f\n', x1, x2, l1, l2);
    end
end

% We previously assigned values to x1, x2, l1, l2 (lines 13-16), hence we
% need to re-state that those are variables with syms.
syms x1 x2 l1 l2;

foo = -4*x1^2 -x2^2 +8*x1 -2*x2;
g1 = x1^2 -2*x1;
g2 = x2^2 -2*x2;
lagrangian = foo + l1*g1 + l2*g2;
gr_lagrangian = gradient(lagrangian, [x1, x2]);
min_x_lagrangian = solve([gr_lagrangian(1) gr_lagrangian(2)], [x1 x2]);
min_x_lagrangian.x1
min_x_lagrangian.x2
fprintf('\n');
lagrangian_relaxation = subs(lagrangian, [x1 x2], [min_x_lagrangian.x1 min_x_lagrangian.x2])
fprintf('\n');
gr_lagrangian_relaxation = gradient(lagrangian_relaxation, [l1 l2]);
v = subs(gr_lagrangian_relaxation, [l1 l2], [2 4]);
if v(1) == 0 && v(2) == 0
    fprintf('Null gradient, valid result: %f\n', subs(lagrangian_relaxation, [l1 l2], [2 4]));
else
    fprintf('Not null gradient: %f %f \n', subs(lagrangian_relaxation, [l1 l2], [2 4]));
end