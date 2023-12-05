locx = [50 50 50 50 50 50 50 50 50];
locy = [60 61 62 63 64 65 66 67 68];

mat_r = zeros(100,100);
mat_g = zeros(100,100);
mat_b = zeros(100,100);

function update_snake(locx, locy)
    mat_r(locx(1), locy(1)) = 255;
    mat_g(locx(1), locy(1)) = 0;
    mat_b(locx(1), locy(1)) = 0;
    
    for i=2:length(locx)
        mat_r(locx(i),locy(i)) = 0;
        mat_g(locx(i),locy(i)) = 255;
        mat_b(locx(i),locy(i)) = 0;
    end
    
    im = uint8(cat(3, mat_r, mat_g, mat_b));
end

imshow(im);