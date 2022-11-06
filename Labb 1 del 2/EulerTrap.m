function [V]=EulerTrap(y_val,a,b,N)

h=(b-a)/N;
y_val(1)=y_val(1)/2; y_val(end)=y_val(end)/2;

A=h*sum(y_val);

V=A*2*pi;

