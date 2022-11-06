%Interpolation genom samtliga punkter:
clc, close all, clear all

x0=[1 32 60 91 121 152 182 213 244 274 305 335 365]'; %Mätpunkter x

h=[6 8 10 13 15 18 18 16 14 11 8 6 6]';
m=[15 6 32 15 55 4 25 38 4 24 46 36 14]';

y0=h+m./60; %Mätpunkter y

A=[x0.^0 x0.^1 x0.^2 x0.^3 x0.^4 x0.^5 x0.^6 x0.^7 x0.^8 x0.^9 x0.^10 x0.^11 x0.^12]; %VÄLDIGT högt kond.tal

c=A\y0;

P=@(x) c(1)*x.^0+c(2)*x.^1+c(3)*x.^2+c(4)*x.^3+c(5)*x.^4+c(6)*x.^5+c(7)*x.^6+c(8)*x.^7+c(9)*x.^8+c(10)*x.^9+c(11)*x.^10+c(12)*x.^11+c(13)*x.^12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%A,B,C

x_lins=linspace(1,365,1000);

P1=P(x_lins); %Interp.polyn.

yi=interp1(x0,y0,x0,"linear"); %styckv. linj. 

ys=spline(x0,y0,x_lins); %spline



figure(1)
hold on
grid on
xlabel("dagar")
ylabel("soltimmar")
ylim([3,19])

plot(x0,y0,"o"),

plot(x_lins,P1)  %Plot av interpolationspolynom 

plot(x0,yi, "--b")

plot(x_lins,ys,"--g")

legend("plot1",["Data","InterP", "StyckLinj", "Spline"])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Andragrads polynom Juni-Aug
figure(2)
hold on
ylim([3,19])
xlabel("dagar")
ylabel("soltimmar")

plot(x0,y0,"o");

x0=[152 182 213];
y0=[18+4/60 18+25/60 16+38/60];

c=polyfit(x0,y0,2);
P2=polyval(c,x_lins);

[s_max,index]=max(P2);
dag = x_lins(index);
disp(s_max)
disp(dag)

plot(x_lins,P2,"-r")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MKM-anpassad andragrads polynom April-Sep
h=[6 8 10 13 15 18 18 16 14 11 8 6 6]';
m=[15 6 32 15 55 4 25 38 4 24 46 36 14]';


x0=[91 121 152 182 213 244];
y0=[13+15/60 15+55/16 18+4/60 18+25/60 16+38/60 14+4/60];

c=polyfit(x0,y0,2);
P3=polyval(c,x_lins);

plot(x_lins,P3,"--g")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MKM-anpassad hela året

x0=[1 32 60 91 121 152 182 213 244 274 305 335 365]'; %Mätpunkter x

h=[6 8 10 13 15 18 18 16 14 11 8 6 6]';
m=[15 6 32 15 55 4 25 38 4 24 46 36 14]';

y0=h+m./60; %Mätpunkter y

c=polyfit(x0,y0,2);
P4=polyval(c,x_lins);

plot(x_lins,P4,"--r")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


A=[x0.^0 cos(((2*pi)/(365))*x0) sin(((2*pi)/(365))*x0)];

ATA=A'*A; ATy=A'*y0;

c=ATA\ATy;

y=c(1)+c(2)*cos(((2*pi)/(365))*x_lins)+c(3)*sin(((2*pi)/(365))*x_lins);

plot(x_lins,y,"-bl")

disp(y(7))

legend("plot",["data","JunAug","AprSep","MKM-År","trig"])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
