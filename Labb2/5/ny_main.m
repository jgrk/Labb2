clc; clear; close all;
format long e

tol=10^-7;
h=1;

func=@(k)(VL(k,tol)-7*(2-k)^4);
k=1:0.01:2;
plot(k,arrayfun(func,k)) %Visualisering av rot

r1=SekMet(func,1,2,tol) %rot

function T = VL(k,tol)

%Funktion som approximerar vänsterledet med integral

integ=@(x)exp(0.5*(k*x)./(3*k+x));
T=integral(integ,1,4*k,"AbsTol",tol);


end

function root = SekMet(func,k0,k1,tol)
%Sekantmetoden

t=1;

while abs(t)>tol
    t=func(k1)*(k1-k0)/(func(k1)-func(k0));
    k=k1-t; k0=k1; k1=k;
end

root=k;

end



