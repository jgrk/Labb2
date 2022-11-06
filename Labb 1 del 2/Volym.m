

function [V]=Volym(y_val,a,b)

h=(b-a)/(length(y_val));
y_val=pi*y_val.^2;


y_val(1)=y_val(1)/2; y_val(end)=y_val(end)/2;




V=h*sum(y_val);

%(y+fel)^2*pi = y^2*pi + 2*y*fel*pi + fel^2*pi



