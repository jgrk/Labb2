clc,clear all

%9a
format long
h = 0.001;  % step size
x = 0:h:3;  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 2.5;  % the initial y value
n = numel(y);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = -((1/6)+(pi*sin(pi*x(i)))/(1.5-cos(pi*x(i))))*y(i);
    y(i+1) = y(i) + h * f;
end
plot(x,y); grid on
Y=y';
X = x';
Va=round(sum(pi*Y.^2*h),3)  
% Blir som Riemannsumma. Blir något större fel men det felet är relativt litet. 
% Eftersom luren går både upp och ner så får vi både under- och för mycket 
% överskattningar och då den är hyfsat symmetrisk så kan man säga att dessa kancelerar varandra till viss grad.


%9b

Vb = 0.75*Va
V = 0;

f =@(x,y,h) y+h*-((1/6)+(pi*sin(pi*x))/(1.5-cos(pi*x))*y)
a = 0;
b = 4;
h = 0.001;
% En variant av intervallhalveringsmetoden
c = (a+b)/2
while V > Vb*1.001 || V<Vb*0.999 % Felgränsen för volymen
    x0=0;
    y0=2.5;
    
    xVardenb = [x0];
    yVardenb = [y0];
    
    for x0 = [x0+h:h:c]
            y1 = f(x0,y0,h);
            y0=y1;
            xVardenb = [xVardenb; x0];
            yVardenb = [yVardenb; y0];
    end
    
    V = round(sum(pi*yVardenb.^2*h),4)
    if V > Vb
        disp("För stor")          
        b=c;
        c = (a+c)/2
    elseif V < Vb
        disp("För liten")        
        a = c;
        c = (c+b)/2
    end

end
Lb = c
plot(xVardenb,yVardenb,"o")
%Lämnar inte mitt i i while utan lämnar innan den kör 
%igen då villkoret inte uppfyllts

%9c
y=y';
x = x';
fi = [0:2*pi/30:2*pi];
X=x*ones(size(fi)); 
Y=y*cos(fi); 
Z=y*sin(fi);
mesh(X,Y,Z)