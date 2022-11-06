%a)
clear all; close all; clc;

format long e

f=@(x)149*exp(-((11*x-pi)/(0.003)).^2);
a=0;
b=6;
tol=10^-8;

Q1=quad(f,a,0.28449,tol,1);
Q2=quad(f,0.28449,0.28674,tol,1);
Q3=quad(f,0.28674,b,tol,1);

I1=integral(f,a,0.28449,"AbsTol",tol); 
I2=integral(f,0.28449,0.28674,"AbsTol",tol);
I3=integral(f,0.28674,b,"AbsTol",tol);


Qtot=Q1+Q2+Q3;

Itot=I1+I2+I3;


%Här har två metoder jämförts:
%både quad och integral använder sig av kvadratisk adaptur.
%integral använder sig ävn utav en relativ tolerans som är mer relevant
%vid högt beräknade integralvärden. Vårat tal är såpass litet att 
%RelTol har för liten inverkan för att vara intressant.

%b)

%När integrandens förändras lite med avseende på x går det bra att använda
%större steglängder, även krävs kortare steglängder för att beräkna
%integrander Med hög förändringstakt. När det sedan kommer till funktioner
%som varierar i förändringstakt bör lämpligtvis kvadratisk adaptur
%användas.
%


