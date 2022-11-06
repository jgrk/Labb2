clear all; close all; clc;

T=3.57010733633814;
inter=[0, 2*T];
init=[3*pi/7, 0.9];

[t,y]=ode45(@DE ,inter, init);

plot(t,y(:,1),'-o',t,y(:,2),'-o')
title('Lösning (L=2.4, g=9.81) med ODE45');
xlabel('Tid t');
ylabel('Lösning y');
legend('theta','theta''')

anim(t,y,T)

theta=y(:,1);

p1=polyfit([t(15) t(16) t(17)], [theta(15) theta(16) theta(17)], 2);

f1=@(x)polyval(p1,x);

fp1=@(a,b)(f1(a)-f1(b))/(a-b);
x0=1;
x1=2;
tr=1;
while abs(tr) > 10^-5
    disp([x1 f1(x1) fp1(x1,x0)])
    tr=f1(x1)/fp1(x1,x0);
    x0=x1;
    x1=x1-tr;
    if f1(x1) == 0
        break
    end
end
r1=x1;

p2=polyfit([t(46) t(47) t(48)], [theta(46) theta(47) theta(48)],2);
f2=@(x)polyval(p2,x);
fp2=@(a,b)(f2(a)-f2(b))/(a-b);
x0=4;
x1=5;
tr=4;
while abs(tr) > 10^-5
    disp([x1 f2(x1) fp2(x1,x0)])
    tr=f2(x1)/fp2(x1,x0);
    x0=x1;
    x1=x1-tr;
    if f2(x1) == 0
        break
    end
end

r2=x1;

period = r2-r1;

function [du]=DE(t,u)
    L=2.4;
    g=9.82;
    du(1)=u(2);
    du(2)=-g/L*sin(u(1));
    du=[du(1); du(2)];
end
    
   








