# Adams Numerical Method for Solving ODE

This Matlab code implements the Adams method for solving a first-order ordinary differential equation (ODE) of the form y'(t) = f(t, y(t)) with initial conditions y(a1) = ya1 and y(a2) = ya2.

The Adams method is a predictor-corrector method that approximates the solution of the ODE at discrete points in the interval [a1,b] by using the values of the solution and its derivatives at previous points. It is an explicit method that is easy to implement and is particularly suited for solving ODEs with smooth solutions.

## Usage

```matlab
[T, Y] = odeadams(f, a1, a2, b, ya1, ya2, h)
```

- `f`: A function handle that represents the right-hand side of the ODE y'(t) = f(t, y(t)).
- `a1`, `a2`: The left endpoints of the interval [a1,b], with initial conditions y(a1) = ya1 and y(a2) = ya2.
- `b`: The right endpoint of the interval [a1,b].
- `ya1`, `ya2`: The initial values of the solution y(t) at t = a1 and t = a2.
- `h`: The step size of the Adams method.
- `T`: A row vector containing the values of t at which the solution is computed.
- `Y`: A row vector containing the values of the solution y(t) at the corresponding values of t in T.

## Example

```matlab
f = @(t, y) y - t^2 + 1;
a1 = 0;
a2 = 0.5;
b = 2;
ya1 = 0.5;
ya2 = 1.25;
h = 0.1;
[T, Y] = odeadams(f, a1, a2, b, ya1, ya2, h);
plot(T, Y, '-o');
xlabel('t');
ylabel('y(t)');
title('Adams Method Example');
```

This example solves the ODE y'(t) = y - t^2 + 1 with initial conditions y(0) = 0.5 and y(0.5) = 1.25 in the interval [0,2] with a step size of 0.1 using the Adams method. The solution is then plotted using Matlab's `plot` function.

## Note

- The code uses the symbolic math toolbox in Matlab to calculate the coefficients of the Adams method, which may slow down the computation for large values of n (number of steps).
- The code assumes that the input function f is a function of two variables t and y.