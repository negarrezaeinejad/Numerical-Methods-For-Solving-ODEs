function [T,Y] = odeadams(f,a1,a2,b,ya1,ya2,h)
syms ts y(t)
n = floor((b-a1)/h);
T = zeros(1,n+1);
Y = zeros(1,n+1);
nb = zeros(1,n+1);
T(1) = a1;
T(2) = a2;
Y(1) = ya1;
Y(2) = ya2;
for i=1:n
        T(i+1)=a1+h*i;
end
for m=1:n
    p1=1;
    for j=m:1
        p1=p1*(ts+(j-1));
        nb(j+1)=((-1)^j)*int(p1,ts,0,1);
    end
    d=zeros(n);
    for k = 1 : m - 1
        d(k, 1) = (subs(f,[t,y(t)],[T(k+1),Y(k+1)]) - subs(f,[t,y(t)],[T(k),Y(k)]));
    end
    for j = 2 : m - 1
         for k = 1 : m - j
             d(k, j) = (d(k+1, j - 1) - d(k, j - 1));
         end
    end
    pp=0;
    for i=1:m
        pp=pp+nb(i)*d(m+1-i,i+1);
    end
    Y(m+1)=Y(m)+h*pp;
end

