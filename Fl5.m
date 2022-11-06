%FL 5

%Minsta kvadrat metoden:

A = [1 1; 1 2; 1 2];
b=[5;6;7];
c = A\b; %MKM per autom

r=b-A*c; %Residual, ska vara så nära noll som möjligt

%Kontroll 1

%Om residualen är tex (-,+,-,+) => Bra!
%Om residual är (-,-,+,+) => Dåligt
%Om residual endast är positiv, dåligt,
%Om residual endast negativ, dåligt

%Kontroll 2

%A'r = k(n1,n2)

%MKM går att fortsätta utveckla för högre graders polynom


