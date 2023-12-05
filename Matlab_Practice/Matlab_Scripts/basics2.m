clc, clearvars, close all
% Close all blocks all the other figures

x = linspace(0,5);
y = (-(x-3).^2) + 10

%plot(x,y, '*') % makes the points appear as stars

MaxVal = max(y)
[MaxVal, I] =  max(y)
x_maxval = x(I)
max(x);
min(y);
min(x);

y1 = @(x) ((-(x-3).^2)) +10; % anonymous function

y1(20.7)

clc, clearvars, close all
x = linspace(-10, 10);
y1 = (-(x-3).^2) + 10;
y2 = (-(x-3).^2) + 15;
y3 = (-(x-5).^2) + 10;

figure(1)
plot(x, y1, '--m', 'MarkerFaceColor', 'm', 'MarkerSize', 10)
xlabel('x'), ylabel('y'), title('Y vs X: Problem A')
grid on

hold on
plot(x, y2, 'bv')
hold on
plot(x, y3, 'g+')

% Go in order
legend('Y1', 'Y2', 'Y3')

figure(2)
subplot(1,3,1)
plot(x, y1, '--ms')
xlabel('x'), ylabel('y'), title('Y vs X: Problem A')
grid on

subplot(1,3,2)
plot(x, y2, 'bv')
xlabel('x'), ylabel('y'), title('Y vs X: Problem A')
grid on

subplot(1,3,3)
plot(x, y3, 'g+')
xlabel('x'), ylabel('y'), title('Y vs X: Problem A')
grid on