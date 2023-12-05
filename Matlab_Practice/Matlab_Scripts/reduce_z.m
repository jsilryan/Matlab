function [z_final] = reduce_z(z_initial)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
z = z_initial;
while z > z_initial / 2+12
    z = z - 1;
end

z_final = z;
end