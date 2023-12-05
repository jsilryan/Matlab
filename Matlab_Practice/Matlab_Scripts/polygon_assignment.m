% 1. Creating Polygon t
t = polyshape([8 12 34 63], [7 28 28 7])

% 2. Translating Polygon t by v -> Polygon t1
v = [-20, 2]
t1 = translate(t, v)

% Ploting t and t1
figure(1)
subplot(1,2,1)
plot(t)
title('Polygon T')
subplot(1,2,2)
plot(t1)
title('Polygon T1: Translated by [-20,1]')

% 3. Scaling t by a factor of 2
factor = 2
t2 = scale(t, factor)

% 4. Scaling t by factor of [2,1]
factor1 = [2,1]
t3 = scale(t, factor1)

% Plotting t2 and t3
figure(2)
subplot(1,2,1)
plot(t2)
title('Polygon T2: Scaled by factor 2')
subplot(1,2,2)
plot(t3)
title('Polygon T3: Scaled by factor [2,1]')

% 5. Rotate t by 30 degrees about origin
degree1 = 30
t4 = rotate(t, degree1)

% 6. Rotate t by 45 degrees about [23,7]
degree2 = 45
point = [23, 7]

t5 = rotate(t, degree2, point)

% Plotting t4 and t5
figure(3)
subplot(1,2,1)
plot(t4)
title('Polygon T4: Rotated by 30 degrees about origin')
subplot(1,2,2)
plot(t5)
title('Polygon T5: Rotated by 45 degrees about [23,7]')

figure(4)
for a = linspace(0, degree1, 100)
    newPolygon = rotate(t, a)

    % Plot polygon
    newPlot = plot(newPolygon)
    title("Animation Rotating T by 30 degrees about origin")

    drawnow;  % Force MATLAB to update the figure
    pause(0.05);
    if a < degree1
        clf
    end
end

figure(5)
for b = linspace(0, degree2, 100)
    newPolygon = rotate(t, b, point)

    % Plot polygon
    newPlot = plot(newPolygon)
    title("Animation Rotating T by 45 degrees about [23,7]")

    drawnow;  % Force MATLAB to update the figure
    pause(0.05);
    if b < degree2
        clf
    end
end