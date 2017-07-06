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
        fprintf('%f\t %f\t |%f\t %f\n', res.x1(i), res.x2(i), res.l1(i), res.l2(i));
    end
end