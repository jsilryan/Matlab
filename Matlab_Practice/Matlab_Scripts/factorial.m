function [output] = factorial(input)
%   Factorial function
if input == 0 || input == 1
    output = 1;
else
    output = input * factorial(input-1);
end

end