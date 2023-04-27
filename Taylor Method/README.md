# Taylor numerical method for solving ODE 

This Matlab code implements the Taylor numerical method for solving ordinary differential equations (ODEs). The function `odetaylor` takes five arguments:

1. `f`: the function that defines the ODE. This function should be defined as a symbolic expression using the `syms` command.
2. `a`: the initial value of the independent variable.
3. `b`: the final value of the independent variable.
4. `ya`: the initial value of the dependent variable.
5. `m`: the number of steps to take in the numerical method.

The function returns two vectors: `T` and `Y`. `T` contains the values of the independent variable at each step, and `Y` contains the values of the dependent variable at each step.

## Usage

To use `odetaylor`, define the symbolic expression for `f` using the `syms` command. Then, call `odetaylor` with the appropriate arguments. For example, to solve the equation `y'=t+y`, `y(0)=1`, `h=0.2`, `o(2)`, `0<t<1`, you would do the following:

```matlab
syms t y
f = t + y;
[T,Y] = odetaylor(f, 0, 1, 1, 5)
```

This will return two vectors, `T` and `Y`, with the following values:

```matlab
T =
    0.0000    0.2000    0.4000    0.6000    0.8000    1.0000

Y =
    1.0000    1.2428    1.5836    2.0442    2.6510    3.4365
```

## Algorithm

The Taylor numerical method is a method for solving ODEs that is based on expanding the solution in a Taylor series around the initial value of the dependent variable. The method then truncates the series after a certain number of terms and uses the resulting polynomial as an approximation of the solution.

In this implementation, the Taylor series is truncated after the third term, resulting in a third-order accurate method. The derivative of the solution is approximated using symbolic differentiation, and the resulting function is evaluated at each step of the method to obtain the value of the next step.

The method is then implemented using a standard loop, with the values of the independent and dependent variables being updated at each step.