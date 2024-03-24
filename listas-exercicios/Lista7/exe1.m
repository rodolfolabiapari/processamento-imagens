img = imread ("lennaRuidoP.png");
imshow(uint8(img));

# Calculando mediana
newimg = medfilt2(img);
figure;
newimg = uint8(newimg);
imshow(newimg);

# Calculando media
mascara = ones(3,3)*1/9;
newimg = imfilter(img,mascara);
figure;
newimg = uint8(newimg);
imshow(newimg);

# Calculando tranformada fourier
newimg = fft2(img);
transformada = fftshift(newimg);
transformada(88-10 : 88+10, 88-10 : 88+10) = 0;
transformada(170-10 : 170+10, 170-10 : 170+10) = 0;
figure;
imshow(log(abs(transformada)+1),[]);

newimg=ifft2(transformada);
figure;
imshow(abs(newimg),[]);
