clc,clear all

f= @(x,a) 149*exp(-((11.*x-a)./(0.003)).^2);
a=pi;


tol=1e-8

% 'Quad'
Q1 = quad(@(x)f(x,a),0,0.28449,tol)
Q2 = quad(@(x)f(x,a),0.28449,0.28674,tol)
Q3 = quad(@(x)f(x,a),0.28449,6,tol)
Q = Q1+Q2+Q3
Eint=tol*abs(Q);
fprintf('Quad ger: %.9f', Q)


% 'Integral'
I1 = integral(@(x)f(x,a),0,0.28449);
I2 = integral(@(x)f(x,a),0.28449,0.28674);
I3 = integral(@(x)f(x,a),0.28674,6);
I = I1 + I2 + I3
fprintf('\nIntegral ger: %.9f', I)