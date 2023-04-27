function [T,Y,k1,k2,k3,k4] = odeRungeKutta4(f,a,b,ya,h)
%this function built for  Runge-Kutta method order 4 in numerical ode.
%usage :
%       solve equation below by  Runge-Kutta order 4 method : y'=t+y , y(0)=1 , h=0.2 ,
%       0 < t < 1
%       for solving in matlab we use odefixedeuler()
%       >>syms y(t) 
%       >>f=t+y(t);
%       >>[T,Y,k1,k2,k3,k4]=odeRungeKutta4(f,0,1,1,0.2)
%       T =
%       0         0.2000    0.4000    0.6000    0.8000    1.0000
%       Y =
%       1.0000    1.2428    1.5836    2.0442    2.6510    3.4365
%       k1 =
%       0         0.2000    0.2886    0.3967    0.5288    0.6902    
%       k2 =
%       0         0.2400    0.3374    0.4564    0.6017    0.7792    
%       k3 =
%       0         0.2440    0.3423    0.4624    0.6090    0.7881     
%       k4 =
%       0         0.2888    0.3970    0.5292    0.6906    0.8878    
%
%       !!warning if h is so small and the distance of t is so small this
%       function won't be helpful!!

syms y(t)
n = floor((b-a)/h);
T = zeros(1,n+1);
Y = zeros(1,n+1);
k1 = zeros(1,n+1);
k2 = zeros(1,n+1);
k3 = zeros(1,n+1);
k4 = zeros(1,n+1);
T(1) = a;
Y(1) = ya;
for i=1:n
        T(i+1)=a+h*i;
end
for i=1:n
        k1(i+1)=h*subs(f,[t,y(t)],[T(i),Y(i)]);
        k2(i+1)=h*subs(f,[t,y(t)],[T(i)+h/2,Y(i)+k1(i+1)/2]);
        k3(i+1)=h*subs(f,[t,y(t)],[T(i)+h/2,Y(i)+k2(i+1)/2]);
        k4(i+1)=h*subs(f,[t,y(t)],[T(i)+h,Y(i)+k3(i+1)]);
        Y(i+1)=Y(i)+(k1(i+1)+2*k2(i+1)+2*k3(i+1)+k4(i+1))/6;
end
end