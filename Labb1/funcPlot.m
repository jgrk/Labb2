%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Skript som visualiserar positiva rötter
%Plottar också asymptoten x=-0.5?????


N=1000;
f=@(x)62*x-((x.^2+x+0.04)./(2*x+1)).^7-19*x.*exp(-x);

x1=linspace(-0.2,1,N);
x2=linspace(3,5,N);

y1=f(x1);
y2=f(x2);

subplot(2,1,1), 
plot(x1,y1), 
ylim([-2,2]), grid on, sgtitle("Positiva rötter")
xlabel("x"), ylabel("f(x)")

subplot(2,1,2), 
plot(x2,y2), 
ylim([-2,2]), grid on
xlabel("x"), ylabel("f(x)")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%