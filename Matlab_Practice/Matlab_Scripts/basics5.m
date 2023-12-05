% If statement
% Logic % Loops
clc, clearvars

A = randi(5, 1, 10000000);

tic % Vectorisation - doing checks on vectors at once rather than each individual term of a matrix
num3_if = sum(A == 3);
if num3_if >= 0.2 * length(A)
    disp('WOW!')
end
Time_if = toc

g = randi(5, 1, 20);
if g == 3
    disp("3 found!")
end

% For loop -> Generally slower
tic
num3_for = 0;
for i = 1:length(A)
    if A(i) == 3
        num3_for = num3_for+1;
    end
end
if num3_for >= 0.2 * length(A)
    disp('WOW!')
end
Time_for = toc
