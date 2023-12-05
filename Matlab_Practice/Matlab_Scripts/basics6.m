% While loops 
% Not predictable
z = 100;
while z > 75
    disp(sqrt(z));
    z = z - 1;
end

z = 75;

reduce_z(z);

a = 8;
factorial(9)

T = table([0; 1; 2], {'A'; 'B'; 'C'}, logical([1; 0; 1]), [20;30;40], 'VariableNames', {'ID', 'Name', 'Flag', 'Position'});
T
W = table([0; 1], ['A'; 'B'], [true; false], [20;30], 'VariableNames', {'ID', 'Name', 'Flag', 'Position'})

student.name = 'Ryan';
student.age = 20;
disp(student)

a = [1,2,5];
a(3)