clc, clearvars, close all
% Based upon the equation, what percent of y-values are greater than 0.8
% for x = 0 to 10

% Parameters
max_x = 6.3
x = linspace(0, max_x, 10000);
y = sin(x);
y_check = 0; % 0.5

% Actions
plot(x,y, '.'), hold on, plot([0,max_x], [y_check,y_check], '-r')
y_greater = y > y_check;

% Output
FinalPercent = sum(y_greater) / length(y) * 100