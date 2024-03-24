t = imread('coins.png');
t = t(:, :, 1);

[row, col] = size(t);
[x,y] = meshgrid(1:row, 1:col);
t2 = double(t) .* ((x+y)/2 + 64) + x + y;
t3 = uint8(255 * mat2gray(t2));

% Divide a imagem
parte_1 = t3(0:row/2, :);
parte_2 = t3(row/2:row, :);

% Encontra o ponto para an?lise
ponto_1 = graythresh(parte_1);
ponto_2 = graythresh(parte_2);

% Realiza a convers?o.
n_image_1 = im2bw(parte_1, ponto_1);
n_image_2 = im2bw(parte_2, ponto_2);

n_img = [n_image_1; n_image_2];

imshow(n_img);