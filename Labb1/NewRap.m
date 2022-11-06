%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Skript som visualiserar positiva rötter

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
%Newton-Raphsons metod för att bestämma alla rötter

disp("Newtons-Raphson");

for n=[-1 -0.48 1 4] %Iterat för varje approximerad rot
    
    x=n; x2=n;
    t=1; t2=1;
    format long e
    maxiter=200;
    i=0;
    disp("   x           f           kvad         x2/x1")
    while abs(t)>10^(-9)
      
        f=62*x-((x^2+x+0.04)/(2*x+1))^7-19*x*exp(-x);
        fp=(14*(x^2+x+0.04)^7)/(2*x+1)^8-(7*(x^2+x+0.04)^6)/((2*x+1)^6)-19*exp(-x)+19*exp(-x)*x+62;
        
        h=62*x-((x^2+x+0.04)/(2*x+1))^7-19*1.031*x*exp(-x);
        hp=(14*(x^2+x+0.04)^7)/(2*x+1)^8-(7*(x^2+x+0.04)^6)/((2*x+1)^6)-19*1.031*exp(-x)+19*1.031*exp(-x)*x+62;
        
        g=t; %För att räkna ut kvad och linj
        g2=t2;
        
        t=f/fp;
        t2=h/hp;
        k=t/g^2; %Konverg.konst. Bör vara konst.
        
    
        x=x-t; %Nya x approximeringen enligt newton
        x2=x2-t2;
        i=i+1; %I inkremerar med 1 för varje loop
        
        disp([x x2 x2/x]); 
        
        if i == maxiter %Stopkriterie
            break
        end
            
    end
    
end

