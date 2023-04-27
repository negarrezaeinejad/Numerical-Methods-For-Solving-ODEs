# Runge Kutta (order 4) Numerical Method For Solving ODE 

This MATLAB function implements the fourth-order Runge-Kutta method for solving ordinary differential equations (ODEs) of the form y' = f(t,y).

## Usage

```matlab
[T,Y,k1,k2,k3,k4] = odeRungeKutta4(f,a,b,ya,h)
```

#### Input Arguments:

- `f`: function handle representing the ODE f(t,y).
- `a`: initial value of the independent variable t.
- `b`: final value of the independent variable t.
- `ya`: initial value of the dependent variable y(a).
- `h`: step size.

#### Output Arguments:

- `T`: array of values of the independent variable t at which the solution is computed.
- `Y`: array of approximate values of the dependent variable y(t).
- `k1`: array of values of the function evaluated at the starting point.
- `k2`: array of values of the function evaluated at the midpoint of the interval using `k1`.
- `k3`: array of values of the function evaluated at the midpoint of the interval using `k2`.
- `k4`: array of values of the function evaluated at the end of the interval using `k3`.

## Example

To solve the ODE y' = t + y, y(0) = 1, with h = 0.2 over the interval [0, 1], we can use the following code:

```matlab
syms y(t)
f = t + y(t);
[T,Y,k1,k2,k3,k4] = odeRungeKutta4(f, 0, 1, 1, 0.2);
```

This will return the following values:

```matlab
T = [0 0.2000 0.4000 0.6000 0.8000 1.0000]
Y = [1.0000 1.2428 1.5836 2.0442 2.6510 3.4365]
k1 = [0 0.2000 0.2886 0.3967 0.5288 0.6902]
k2 = [0 0.2400 0.3374 0.4564 0.6017 0.7792]
k3 = [0 0.2440 0.3423 0.4624 0.6090 0.7881]
k4 = [0 0.2888 0.3970 0.5292 0.6906 0.8878]
```

## Warning

Note that if the step size `h` is too small or the distance of `t` is too small, this function may not produce accurate results.