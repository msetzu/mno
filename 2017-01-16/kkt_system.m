clear;
clc;

syms x1 x2 l1 l2 l3;
eq0 = -2*x1 - 6 + l1 - l3;
eq1 = -2*x2 - 4 + l2 - l3;
eq2 = l1*x1;
eq3 = l2*x2;
eq4 = l3*(-x1 -x2 -2);

res = solve([eq0 eq1 eq2 eq3 eq4], [x1 x2 l1 l2 l3]);

k = size(res.l1,1);

for i = 1:k
    if (res.l1(i) >= 0 && res.l2(i) >= 0 &&res.l3(i) >= 0 && res.x1(i) <= 0 && res.x2(i) <= 0 && (-res.x1(i) -res.x2(i) -2 <= 0))
        fprintf('x#%d: %f\t %f\t %f\t %f\t %f\n', i,res.x1(i), res.x2(i), res.l1(i), res.l2(i), res.l3(i))
    end
end