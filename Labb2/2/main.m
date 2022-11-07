clear; close all; clc;

a=0; b=3.6; h=0.075;  %Randpunkter(a,b), steglängd(h)
Etrunc=1;

while Etrunc > 10^-6
    
    h=h/2;
    T=CDM(a,b,h);
    T1=T(1.65/h);
    
    h2=2*h; 
    TT=CDM(a,b,h);
    T2=T(1.65/h);
    
    Etrunc=abs(T1-T2);
    
    

end

x=0:h:3.6;
hold on
plot(x,[315 T 445]); xlabel("Längd [m]"); ylabel("Temp. [K]")
plot([0 3.6],[315 445],"r*");