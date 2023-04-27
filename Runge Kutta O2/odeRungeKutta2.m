function [T,Y,k1,k2] = odeRungeKutta2(f,a,b,ya,h)
%this function built for  Runge-Kutta method order 2 in numerical ode.
%usage :
%       solve equation below by  Runge-Kutta order 2 method : y'=t+y , y(0)=1 , h=0.2 ,
%       0 < t < 1
%       for solving in matlab we use odefixedeuler()
%       >>syms y(t) 
%       >>f=t+y(t);
%       >>[T,Y,k1,k2]=odeRungeKutta4(f,0,1,1,0.2)
%       T =
%       0         0.2000    0.4000    0.6000    0.8000    1.0000
%       Y =
%       1.0000    1.2400    1.5768    2.0317    2.6307    3.4054
%       k1 =
%       0         0.2000    0.2880    0.3954    0.5263    0.6861 
%       k2 =
%       0         0.2800    0.3856    0.5144    0.6716    0.8634 
%
%       !!warning if h is so small and the distance of t is so small this
%       function won't be helpful!!

syms y(t)
n = floor((b-a)/h);
T = zeros(1,n+1);
Y = zeros(1,n+1);
k1 = zeros(1,n+1);
k2 = zeros(1,n+1);
T(1) = a;
Y(1) = ya;
for i=1:n
        T(i+1)=a+h*i;
end
for i=1:n
        k1(i+1)=h*subs(f,[t,y(t)],[T(i),Y(i)]);
        k2(i+1)=h*subs(f,[t,y(t)],[T(i)+h,Y(i)+k1(i+1)]);
        Y(i+1)=Y(i)+(k1(i+1)+k2(i+1))/2;
end
end