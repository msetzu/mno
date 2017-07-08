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
        fprintf('%f\t %f\t %f\t %f\n', x1, x2, l1, l2);
    end
end