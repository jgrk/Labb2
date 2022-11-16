clear; close all; clc;
format long e

a=0; b=3.6; h=0.075;  %Randpunkter(a,b), steglängd(h)
Etrunc=1; T2=1;

disp("     T                         Trunc")
while Etrunc > 10^-5
    
    
    T=CDM(a,b,h);
    T1=T(1.65/h);
    
    Etrunc=abs(T1-T2); 
    disp([T1 Etrunc])
    T2=T1;
    h=h/2;

end

x=0:2*h:3.6;
hold on
plot(x,[315 T 445]); xlabel("Längd [m]"); ylabel("Temp. [K]")
plot([0 3.6],[315 445],"r*");