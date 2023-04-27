# Runge Kutta (order 2) Numerical Method For Solving ODE 

This Matlab function implements the Runge-Kutta method order 2 numerical method for solving ODEs.

## Usage

```matlab
[T,Y,k1,k2] = odeRungeKutta2(f,a,b,ya,h)
```

## Inputs

- `f` : the function handle for the ODE to solve.
- `a` : the initial value of the independent variable.
- `b` : the final value of the independent variable.
- `ya` : the initial value of the dependent variable.
- `h` : the step size.

## Outputs

- `T` : a vector containing the values of the independent variable.
- `Y` : a vector containing the values of the dependent variable.
- `k1` : a vector containing the values of the first slope estimate.
- `k2` : a vector containing the values of the second slope estimate.

## Example

To solve the ODE `y' = t + y`, `y(0) = 1` for `0 < t < 1` using the Runge-Kutta order 2 method with a step size of `h=0.2`, the following code can be used:

```matlab
syms y(t) 
f = t + y(t);
[T,Y,k1,k2] = odeRungeKutta2(f, 0, 1, 1, 0.2)
```

This will output the following result:

```matlab
T =
   0.0000    0.2000    0.4000    0.6000    0.8000    1.0000

Y =
   1.0000    1.2400    1.5768    2.0317    2.6307    3.4054

k1 =
   0.0000    0.2000    0.2880    0.3954    0.5263    0.6861

k2 =
   0.0000    0.2800    0.3856    0.5144    0.6716    0.8634
```

**Warning**: If the step size `h` is too small and the distance of `t` is also small, this function may not be helpful.