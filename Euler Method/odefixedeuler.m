function [T,Y,YY] = odefixedeuler(f,a,b,ya,h)
%this function built for  purified euler method in numerical ode.
%usage :
%       solve equation below by  purified euler method : y'=t+y , y(0)=1 , h=0.2 ,
%       0 < t < 1
%       for solving in matlab we use odefixedeuler()
%       >>syms y(t) 
%       >>f=t+y(t);
%       >>[T,Y]=odefixedeuler(f,0,1,1,0.2)
%       T=
%                0    0.2000    0.4000    0.6000    0.8000    1.0000
%       Y=
%           1.0000    1.2400    1.5768    2.0317    2.6307    3.4054
% 
%       !!warning if h is so small and the distance of t is so small this
%       function won't be helpful!!

syms y(t)
n = floor((b-a)/h);
T = zeros(1,n+1);
Y = zeros(1,n+1);
YY = zeros(1,n+1);
T(1) = a;
Y(1) = ya;
YY(1) = ya;
ff=h*f+y(t);
for i=1:n
        T(i+1)=a+h*i;
end
for i=1:n
        YY(i+1)=subs(ff,[t,y(t)],[T(i),Y(i)]);
        Y(i+1)=Y(i)+h/2*(subs(f,[t,y(t)],[T(i+1),YY(i+1)])+subs(f,[t,y(t)],[T(i),Y(i)]));
end

end

