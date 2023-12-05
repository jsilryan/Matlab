im1 = [1 23 34 45; 56 67 78 89; 90 101 122 133; 144 155 166 177];

% imshow(uint8(im));
% subimage(uint8(im));
mat_r = zeros(10,10);
mat_g = zeros(10,10);
mat_b = zeros(10,10);
im = cat(3, mat_r, mat_g, mat_b);
subimage(uint8(im));

mat_g1 = 80 * ones(10,10);

im2 = cat(3, mat_r, mat_g1, mat_b);

subimage(uint8(im2));


