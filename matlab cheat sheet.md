# Matlab cheat sheet

## Equation system solver
```
f(x, y z) = x^2 + 2y^2 + z
g(x, y z) = x + 2z
h(x, y z) = 2y^2 + 3z```

Instantiate symbol names:
```matlab
syms x y z;
```
Create equations:
```matlab
eq0 = x^2 + 2*y^2 + z;
eq1 = x + 2*z;
eq2 = 2*y^2 + 3*z;
```
The `solve(equations, symbols)` function returns a structure containing the values associated to each symbol, and can be accessed through `results.$symbol` where `$symbol` is the desired symbol.
```matlab
results = solve([eq0, eq1, eq2], [x y z]);
```
#### Example (2017-07-03 written test)
The following finds the roots of the **equalities** (the inequalities are not considered in the example) of the _KKT system_ for the minimization problem of exercise 2.
Note that the system encompasses some inequalities, hence **these results may include values which do not satisfy the system**.


![kkt](http://i.imgur.com/yX7VuGv.png "KKT")
```matlab
syms x y l1 l2;
eq0 = -8*x + 8 + l1 * (2*x-2);
eq1 = -2*y -2 + l2*(2*y - 2);
eq2 = l1*(x^2-2*x);
eq3 = l2*(y^2-2*y);
res = solve([eq0 eq1 eq2 eq3],[x y l1 l2]);
k = size(res.x, 1);
for i = 1:k
fprintf('x[%d]: %f\t %f\t %f\t %f\n',i, res.x(i), res.y(i), res.l1(i), res.l2(i));
end
```


## Unconstrained minimum finding
Find the minimum in an unconstrained minimization problem of the form:
```matlab
min f(x, y, z)
x \in R^n
```
starting from an initial point `p0 = [x0, y0, z0]`.
```
y = fminunc('foo', p0, options);
```
. Here `foo` is the string name of the function whose unconstrained minimum we want to compute.
Note that `foo` has to have a particular form:
```matlab
function [v, g] = foo(x)
  v = ...
  g = ...
end
```
. `foo` **has to** return both the value of the function and its gradient computed in `x`.


## Constrained minimum finding
Find the minimum in an unconstrained minimization problem of the form:
```
min f(x, y, z)
g(x,y,z) <= 0
h(x,y,z) = 0
```
. An equivalent form for problems with no equality constraints is
```
min f(x, y, z)
Ax <= b
```
where `A` is the coefficients matrix of the inequality constraints and `b` the column vector of the pure terms.
We can then solve through
```matlab
results = fmincon('foo', p0, A, b);
```
#### Example (2017-07-03 written test)
We solve the exercise 2's minimum finding


  ![system](http://i.imgur.com/WAAMs6q.png "System")

The whole system is


  ![kkt](http://i.imgur.com/yX7VuGv.png "KKT")
```matlab
% Instantiate symbols
syms x y l1 l2;

% Define equations of the Lagrangian's gradient.
eq0 = -8*x + 8 + l1 * (2*x-2);
eq1 = -2*y -2 + l2*(2*y - 2);
eq2 = l1*(x^2-2*x);
eq3 = l2*(y^2-2*y);

% Solve the system
res = solve([eq0 eq1 eq2 eq3],[x y l1 l2]);

% Iterate on the results
k = size(res.x, 1);
for i = 1:k
  % We filter the results by inequalities on the lambda multipliers >= 0
  % and the usual inequalities constraints.
  if res.l1(i) >= 0 && res.l2(i) >= 0 && res.x(i)^2 - 2*res.x(i) <= 0 && res.y(i)^2 - 2*res.y(i) <= 0
    fprintf('x[%d]: %f\t %f\t %f\t %f\n',i, res.x(i), res.y(i), res.l1(i), res.l2(i));
  end
end
```

## Lagrangian relaxation
The Lagrangian relaxation is the minimum of the Lagrangian function.
As such, we *usually* (not always) are able to find the minimum `x` quite easily (quadratic Lagrangians come to mind), but replacing it in the Lagrangian function is time-consuming.
Matlab has a package, `subs` that deals with assigning values to variables in an expression and reduce it to the minimum number of terms.

```matlab
lagrangian = x2^2*(l2 - 1) - x1*(2*l1 - 8) + x1^2*(l1 - 4) - 2*x2*(l2 + 1);
```
Since we have a quadratic Lagrangian we can minimize by setting the gradient to `0`.
We can get the gradient and get its unique solution (we have two variables and two equations) with
```matlab
gr_lagrangian = gradient(lagrangian, [x1 x2]);
res = solve([gr_lagrangian(1) gr_lagrangian(2)], [x1 x2]);
```
With a minimum in `x = [1, (1+l2)/(-1+l2)]` we can substitute those values in the Lagrangian:
```matlab
>> subs(lagrangian, [x1, x2], [res.x1, res.x2])

ans =

4 - (l2 + 1)^2/(l2 - 1) - l1
```
**NB:** Solve returns a *structure of vectors* when you have more than one solution, and a *map* when it has a single solution.
Such map is accessed through `map.var` as shown in the case of `res.x1`.