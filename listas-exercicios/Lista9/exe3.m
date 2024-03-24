a = imread('coins.png');
a = uint8(a(:, :, 1));
[row, col] = size(a);

b = [0 1 0; 1 1 1; 0 1 0];

imshow(a); figure;

erosao = a;

abertura = imopen(erosao, b);

while any(abertura(:))    
    diferenca = erosao & ~abertura;
    
    erosao = imerode(diferenca, b);
    
    abertura = imopen(erosao, b);
end

imshow(diferenca);