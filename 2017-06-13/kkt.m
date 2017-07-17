clear all; clc;
syms x1 x2 l1 l2;

foo = x1 + x2;
g1 = x1^2 + x2^2 - 5;
g2 = x1^2 - 1;
lagrangian = foo + l1*g1 + l2*g2;
gr_lagrangian = gradient(lagrangian, [x1 x2]);

gr_foo = gradient(foo, [x1 x2]);
gr_g1 = gradient(g1, [x1 x2]);
gr_g2 = gradient(g2, [x1 x2]);

eq0 = gr_foo(1) + l1*gr_g1(1) + l2*gr_g2(1);
eq1 = gr_foo(2) + l1*gr_g1(2) + l2*gr_g2(2);
eq2 = l1*g1;
eq3 = l2*g2;

res = solve([eq0 eq1 eq2 eq3], [x1 x2 l1 l2]);

for i = 1 : size(res.x1, 1)
    res_x1 = res.x1(i);
    res_x2 = res.x2(i);
    res_l1 = res.l1(i);
    res_l2 = res.l2(i);
    
    if (res_l1 >= 0 && res_l2 >= 0 && subs(g1, [x1 x2], [res_x1 res_x2]) <= 0 && subs(g2, [x1 x2], [res_x1 res_x2]) <= 0)
        fprintf('Minimum: %f\t %f\t %f\t %f\n', res_x1, res_x2, res_l1, res_l2);
    end
end

min_x_lagrangian = solve([gr_lagrangian(1) gr_lagrangian(2)], [x1 x2]);

fprintf('Lagrangian');
lagrangian
fprintf('\nLagrangian gradient');
gr_lagrangian
fprintf('\nMin x Lagrangian');
min_x_lagrangian.x1
min_x_lagrangian.x2
fprintf('\nRelaxation');
lagrangian_relaxation = subs(lagrangian, [x1 x2], [min_x_lagrangian.x1 min_x_lagrangian.x2])
fprintf('\nRelaxation in (1,0)\n');
gr_relaxation = gradient(lagrangian_relaxation, [l1 l2]);
v = subs(gr_relaxation, [l1 l2], [1 0]);
if v(1) == 0 && v(2) == 0
    fprintf('Null gradient, optimal solution.\n');
else
    fprintf('Not null gradient, not an optimal solution: %f %f\n', v(1), v(2));
end