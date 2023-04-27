function [T,Y] = odetaylor(f,a,b,ya,m)
%this function built for taylor method in numerical ode.
%usage :
%       solve equation below by taylor method : y'=t+y , y(0)=1 , h=0.2 ,
%       o(2) , 0 < t < 1
%       for solving in matlab we use odetaylora()
%       >>syms t y 
%       >>f=t+y;
%       >>[T,Y]=odetaylor(f,0,1,1,5)
%       T =
%       0    0.2000    0.4000    0.6000    0.8000    1.0000
%       Y =
%       1.0000    1.2428    1.5836    2.0442    2.6510    3.4365
%

syms t y

ff(1) = symfun(f, [t y]); 


for i=1:3
    ff(i+1) = diff(ff(i),t)+f*diff(ff(i),y);
end
df = matlabFunction(symfun(ff,[t y]));

h = (b - a)/m;                                 
T = zeros(1,m+1);
Y = zeros(1,m+1);
T(1) = a;
Y(1) = ya;

for j=1:m
  tj = T(j);
  yj = Y(j);
  D = df(tj,yj);
  Y(j+1) = yj + h*(D(1)+h*(D(2)/2+h*(D(3)/6+h*D(4)/24)));
  T(j+1) = a + h*j;
end


end