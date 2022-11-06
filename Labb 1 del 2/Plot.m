close all; clear all; clc;
%Införda beteckningar: 
% Integralen av f(x) över intervallet a-b = I(a,b)
% Integrand=f(x)
format long e
f=@(x)(1-exp(-(x/5)^3))/(3*x^3);


%a) Plot

N = 100;
x=linspace(0.000001, 10^(-4), N);
y=(1-exp(-(x/5).^3))./(3*x.^3);

% hold on
% xlim([0 10^-4])
% ylim([min(y) max(y)])
% 
% plot(x,y) 
% xlim([0 10^-4])
% ylim([min(y) max(y)])

%Utvärdering: Integranden bör inte oscillera som den gör i nuläget.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%b) För varje x>0, gäller att 1/(3x^3) är strikt större än våran integrand
%Vilket medför att detta även gäller för respektive integral, räknat över samma
%intervall (fortf. x>0). 1(3x^3) är enkel att integrera och vi kan undersöka vad B blir 
%genom att räkna 1/(6B^2) - 1/inf = 10^-10 => B = (10^10/6)^0.5 < 40825 
% => Våran integral över intervallet [B,inf) är strikt mindre än 10^-10
%Således kan vi neglera I(40825,inf).

E1 = 10^-10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%c) Eliminering av "darrandet": Vi kan approximera våran integral 
%över (0,10^-4] Med hjälp av Trapetsregeln.

h=10^-4;
y1=1/375;
y2=f(h/2);
y3=f(h);


T1=h*(y1+y3)/2;
T2=h*(y1+2*y2+y3)/4;

I=T2;

E2=abs(T2-T1);
%E2=5.328518915723593e-11

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%d) Behövs ytterligare förbehandlingar?:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%e) Beräkna värdet:

a=10^-4;
b=40825;

N2=100000000;
N1=N2/2;

T1=TrapReg(a,b,N1);
T2=TrapReg(a,b,N2);

I=I+T2;

E3=abs(T2-T1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%f) Skattning av felet: 


%Vi utgår från värsta fallet

Etot = E1+E2+E3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
