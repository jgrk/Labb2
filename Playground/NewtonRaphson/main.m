
f=@(x)x.^2;
fp=@(x)2*x;

r=newrap(10^-9,1,f,fp);