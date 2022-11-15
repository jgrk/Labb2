
clear; close all; clc;

clc;clear;close all;

h=1; tol=10^-8;

k=0;

f=@(x)(exp(.5*(k*x)./(3*k+x)));

func=@(k)(integral(f,1,4*k,"AbsTol",tol)-7*(2-k)^7);
% x=1:h:4;

% plot(x,arrayfun(func,x))

%%

k0=1; k1=2;

r1 = SekMet(func,k0,k1,tol);

%%

k0=3; k1=4;

r2 = SekMet(func,k0,k1,tol);
%%














