clear all; close all; clc;

img = imread('lenna.png');
[lin, col] = size(img);

% Gera numeros complexos
fourier = fftshift(fft2(img));

% Pra ver a imagem tem que pegar o valor absoluto
%imgFourier = abs(fourier);
%imgFourier = 15 * log(1 + imgFourier);
%imgFourier = uint8(imgFourier);
%figure; imshow(imgFourier);

%meshFourier
u = 0:lin-1;
v = 0:col-1;

u = u - floor(lin/2);
v = v - floor(col/2);
[U, V] = meshgrid(u, v);

H = -(U.^2 + V.^2);

% Dominio de frequencia
novaFourier = H .* fourier;

%Gerando ao inversa
inversa = ifft2(novaFourier);
inversa = abs(inversa);
%inversa = uint8(inversa);
imshow(inversa, []);
