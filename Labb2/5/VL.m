function T = VL(k,h)

integ=@(x)exp(0.5*(k*x)/(3*k+x));
T=h/2*sum([integ(1) 2*[arrayfun(integ, 1+h:h:4*k-h)] integ(4*k)]);



end

