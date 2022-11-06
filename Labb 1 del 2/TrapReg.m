function [I]=TrapReg(a,b,N,tol)


f=@(x)(1-exp(-(x/5)^3))/(3*x^3);
h=(b-a)/N;
I=h*0.5*(f(a)+f(b));


for i=linspace(a+h,b-h,(b-a-2*h)/h)
    I=I+h*f(i);
    
end



