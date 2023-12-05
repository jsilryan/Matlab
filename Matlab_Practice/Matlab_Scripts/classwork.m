x = [0 0.25*pi 0.5*pi 0.75*pi pi];
y = [0; 0.25*pi; 0.5*pi; 0.75*pi; pi];

x(3)
y(5)
x(1:2:3)

dot(x,y) % Scalar dot product

f = [1,2;3,4];

g = 2*f -1

a = [1,2,3];
b = [4,5,6];
c = a.*b
a'

A = [3 2 -1; -1 3 2; 1 -1 -1];
b = [10; 5; -1];

T = A'
T2 = inv(A)

x = T2*b

y = A\b

x = linspace(0, 4*pi, 100);
y = sin(x);

figure(1)
plot(y)
ylabel('sin(x)')
xlabel('x')
title('Get sin(x)')

y1 = exp(-x/3)
y2 = y.* y1


figure(2)
subplot(1,2,1)
plot(y2)
title('y2 = y.*y1')
subplot(1,2,2)
plot(y1)
title('y1 = exp(-x/3)')

figure(3)
subplot(1,2,1)
stem(y)
subplot(1,2,2)
stem(y2)
 