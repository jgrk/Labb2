function r = newrap(TOL,x0,f,fp)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t=1;
i=1;
while abs(t) >= TOL
   
    gt=t;
    t=f(x0)/fp(x0);
    k=t/(gt^2);
    x0=x0-t;
    
    
    

    disp([i x0 k t])
    i=i+1;
end

r=x0;
    

