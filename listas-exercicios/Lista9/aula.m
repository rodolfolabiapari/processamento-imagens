a = imread('coins.png');
a = uint8(a(:, :, 1));

b = [0 1 0; 1 1 1; 0 1 0];

conv2(a, b)

c =  - a;

%imshow(c);