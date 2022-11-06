function [y]=EulerMet(a,b,N)

h=(b-a)/N;

ydot=@(x,y)-(1/6+pi*sin(pi*x)/(1.5-cos(pi*x)))*y;

y=2.5;
k=1;
for i=linspace(a+h,b,(b-a-h)/h)
    k=k+1;
    y(k)=y(k-1)+h*ydot(i,y(k-1));
end



