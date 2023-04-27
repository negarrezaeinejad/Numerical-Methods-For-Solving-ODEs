# Euler Numerical Method for Solving ODE

This is a Matlab code implementing the Euler numerical method for solving ordinary differential equations. It approximates the solution at discrete points by using the value of the previous point and the derivative evaluated at that point.

## Function usage

The function `odefixedeuler()` takes 5 input arguments:

- `f`: the right-hand side of the ODE as a symbolic expression in `t` and `y(t)`
- `a`: the initial value of `t`
- `b`: the final value of `t`
- `ya`: the initial value of `y(a)`
- `h`: the step size

The function returns 3 output arguments:

- `T`: a vector containing the values of `t` at which the solution is approximated
- `Y`: a vector containing the approximated values of `y(t)` corresponding to the values of `t` in `T`
- `YY`: a vector containing the intermediate values of `y(t)` used in the computation

## Example

Solve the ODE `y' = t + y` with initial condition `y(0) = 1`, using `h = 0.2` and `0 < t < 1`:

```matlab
syms y(t)
f = t + y(t);
[T, Y] = odefixedeuler(f, 0, 1, 1, 0.2);
```

The output should be:

```matlab
T =
     0    0.2000    0.4000    0.6000    0.8000    1.0000
Y =
    1.0000    1.2400    1.5768    2.0317    2.6307    3.4054
```

Note that if `h` is too small and the distance between `a` and `b` is too small, this method may not be accurate.