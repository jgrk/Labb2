% Sekantmetoden, superlinjär konvergens


intrv=[-2 -1; -0.48 -0.45; 0 0.5; 3 4]; %Start intervall
format long e

for x=1:4
    x0=intrv(x,1);
    x1=intrv(x,2);
    g0=1; g1=1;
    disp("     x                            konv ")

    while abs(x1-x0) > 10^(-8)
    
        f0=62*x0-((x0^2+x0+0.04)/(2*x0+1))^7-19*x0*exp(-x0);
        f1=62*x1-((x1^2+x1+0.04)/(2*x1+1))^7-19*x1*exp(-x1);
        
        t=f1*((x1-x0)/(f1-f0));
    
        gx0=x0;
        x0=x1;
        x1=x1-t;
        
        k=t/(g1*g0);
        g0=g1; g1=t;
        disp([x1 abs(k)])
    end
    
end











