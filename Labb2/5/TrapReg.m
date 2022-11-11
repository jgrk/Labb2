function [T] = TrapReg(integ,a,b,h)

ya=integ(a);
yb=integ(b);

T=h/2*sum([ya 2*[arrayfun(integ, a+1:h:b-1)] yb]);


end

