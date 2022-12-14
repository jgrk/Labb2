format long e

%a)

close all; clear all; clc; 

F=@(X,Y,R)[
    X^2+Y^2-R^2-14*X-18*Y+130; 
    X^2+Y^2-R^2-18*X-4*Y+85; 
    X^2+Y^2-R^2-8*X-18*Y+97]; %Denna rad multipliceras med 4 i uppg. c)


DF=@(X,Y,R)[
    [2*X-14 2*Y-18 -2*R]; 
    [2*X-18 2*Y-4 -2*R]; 
    [2*X-8 2*Y-18 -2*R]]; %Denna rad multipliceras med 4 i uppg. c)

x=[0;0;10];
t=[1;1;1];

while norm(t) > 10^-7
    disp(norm(t))
    t=DF(x(1),x(2),x(3))\F(x(1),x(2),x(3));
    x=x-t;

end

%rot=5.500000000000000e+00
    %4.785714285714286e+00
    %4.473276660528907e+00

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b)
% 
% theta=0:pi/50:2*pi;
% xx=x(3)*cos(theta)+x(1);
% yy=x(3)*sin(theta)+x(2);
% 
% hold on
% plot([7,9,4],[9,2,9], "b*")
% plot(xx,yy)



%%
%c)

%Vi får samma rötter, att skalärmultiplicera en av ekv. i sys. ger samma
%ekv.sys

%%
%d) %Indata: (7,9), (9,2), (4,9), (10,10), (2,9)

F=@(X,Y,R)[
    X^2+Y^2-R^2-14*X-18*Y+130; 
    X^2+Y^2-R^2-18*X-4*Y+85; 
    X^2+Y^2-R^2-8*X-18*Y+97;
    X^2+Y^2-R^2-20*X-20*Y+200;
    X^2+Y^2-R^2-4*X-18*Y+85];

DF=@(X,Y,R)[
    [2*X-14 2*Y-18 -2*R]; 
    [2*X-18 2*Y-4 -2*R]; 
    [2*X-8 2*Y-18 -2*R];
    [2*X-20 2*Y-20 -2*R];
    [2*X-4 2*Y-18 -2*R]];

x=[0;0;10];
t=[1;1;1];

while norm(t) > 10^-6
    disp(norm(t))
    j=DF(x(1),x(2),x(3));
    f=F(x(1),x(2),x(3));
    t=j\f; %%%Blir automatiskt MKM-lösn.
    x=x-t;
    
end


%X=5.9912, Y=5.93860, R=4.81995
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%g) och h)

%(xi-X)^2+(yi-Y)^2=R^2, {c0=R^2-X^2-Y^2, c1=2X, c2=2Y}
% => xi^2+i^2 = c0+c1X+c2Y

x=[7 9 4]';
y=[9 2 9]';

A=[x.^0 x y];
% A=[1 7 9;1 9 2; 4 16 36];
b=x.^2+y.^2;
% b=[49+81; 81+4;4*(16+81)];

C=A\b;

X=C(2)/2;
Y=C(3)/2;
R=sqrt(C(1)+X^2+Y^2);


%X=5.5, Y=5.9676, R=4.5788
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%













