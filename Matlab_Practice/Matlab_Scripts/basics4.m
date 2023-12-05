%% Section 1
% If statement
% Logic % Loops
clc, clearvars

A = randi(5, 1, 10)

num3 = sum(A == 3)
if num3 >= 3
    disp('WOW')
end

%% Section 2
% for  loop
clc, clearvars
A = randi(5, 1, 10)
num3 = 0;
for i = 1:length(A)
    if A(i) == 3;
        num3 = num3+1;
    end
end
if num3 >= 3
    disp('WOW!')
end
