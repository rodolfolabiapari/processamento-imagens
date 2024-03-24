a = imread('coins.png');
a = uint8(a(:, :, 1));
[row, col] = size(a);

b = [0 1 0; 1 1 1; 0 1 0];

erosao = a - (imerode(a, b));
dilatacao = (imdilate(a, b)) - a;
grad_mofolog = imdilate(a, b) - imerode(a, b);

figure; imshow(erosao);
figure; imshow(dilatacao);
figure; imshow(grad_mofolog);