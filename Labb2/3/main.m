% Inskjutningsmetoden
% Skriver om systemet till förtsa ordningens ode
clc; clear all; close;

guess = 100;
x = fzero(@solver,guess)    % Lutningen

up = @(x, u) [u(2); (-280.*exp(-(x-3.6/2).^2) - u(2)./3) ./ (2 + x./3)];%Reducerad ODE
guess = x;
T0 = 315;
u0 = [T0, guess];
[t, U] = ode45(up, [0,3.6], u0);
figure(2)
plot(t, U(:,1))
disp(t + " " + U(:,1))

index = 1;
while true
    if t(index) > 1.65
        break
    end
    index = index + 1;
end
Temp = U(:,1);
disp(t(index - 1) + " " + Temp(index - 1))
disp(t(index) + " " + Temp(index))
line = @(x) Temp(index) + ( (Temp(index)-Temp(index-1))/(t(index) - t(index - 1)) ).* (x - t(index)) ;
test_t = linspace(t(index) - .5, t(index) + .5);
hold on
plot(test_t, line(test_t))
disp(line(1.65))


% Spline
figure(3)
xx = 0:.01:4;
yy = spline(t, U(:,1), xx);
hold on
plot(t, U(:,1), 'o', xx,yy)

% Hitta index
for k = 1:length(xx)
    if xx(k) > 1.65
        break
    end
end
disp(xx(k))
disp(yy(k))

function F = solver(guess)
up = @(x, u) [u(2); (-280.*exp(-(x-3.6/2).^2) - u(2)./3) ./ (2 + x./3)];
T0 = 315;
u0 = [T0, guess];
[t, U] = ode45(up, [0,3.6], u0);
figure(1)
plot(t, U(:,1))
v = U(:,1);
F = v(end) - 445;
end