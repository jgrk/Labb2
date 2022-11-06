clear; close all; clc;

a=0; b=3.6; h=0.15; n=(b-a)/h; %Randpunkter(a,b), steglängd(h), delintervall(n)
k=@(x)(2+x/3); dk=1/3; %Givna funktionen k
Q=@(x)(280*exp(-(x-1.8)^2)); %Givna funktionen Q

x=a+h:h:b-h; 
T=zeros(length(x),1); %Sökt
T(1)=315; T(end)=445;

b=zeros(length(x),1); %Kända Termer/Högerled b
b(1)=Q(x(1))-T(1)*(dk/(2*h)-k(x(1))/h^2);
b(end)=Q(x(end))+T(end)*(dk/(2*h)+k(x(end))/h^2);

A=zeros(length(x),length(x)); %Koeff.matris A
A(1,1)=2*k(x(1))/h^2;

for idx=2:1:length(x)-1
    b(idx)=Q(x(idx));
end

for idx=2:1:length(x)
    A(idx,idx)=2*k(x(idx))/h^2;
    A(idx-1,idx)=(-dk/(2*h)-k(x(idx-1))/h^2);
    A(idx,idx-1)=(dk/(2*h)-k(x(idx))/h^2);
end

T=[T(1) (A\b)' T(end)]; 

x=0:h:3.6;

plot(x,T); xlabel("Längd [m]"); ylabel("Temp. [K]")