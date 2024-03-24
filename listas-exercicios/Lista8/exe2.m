clear all; close all; clc;

img = imread('matches.png');
[lin, col] = size(img);

% Gera numeros complexos
fourier = fftshift(fft2(img));

%meshFourier
u = 0:lin-1;
v = 0:col-1;

u = u - floor(lin/2);
v = v - floor(col/2);
[U, V] = meshgrid(u, v);

H = -(U.^2 + V.^2);

distancias = sqrt(U.^2 + V.^2);

raio = 15;
mascaraIdealBaixa = (distancias < raio);
mascaraIdealAlta =  (distancias > raio);

mascaraGaussianaBaixa =     exp(-((distancias.^2) / (2 * raio ^ 2)));
mascaraGaussianaAlta  = 1 - exp(-((distancias.^2) / (2 * raio ^ 2)));

n = 1;

mascaraButterworthBaixa =  1 / 1 + ( distancias ./ raio ) .^ ( 2 * n);
mascaraButterworthAlta  =  1 / 1 + ( raio ./ distancias ) .^ ( 2 * n);

% Dominio de frequencia
idealBaixa = mascaraIdealBaixa .* fourier;
idealAlta  = mascaraIdealAlta  .* fourier;

GaussianaBaixa = mascaraGaussianaBaixa .* fourier;
GaussianaAlta  = mascaraGaussianaAlta  .* fourier;

ButterworthBaixa = mascaraButterworthBaixa .* fourier;
ButterworthAlta  = mascaraButterworthAlta  .* fourier;

%Gerando ao inversa
inversa = ifft2(ButterworthAlta);
%inversa = ifft2(ButterworthBaixa);
%
%inversa = ifft2(GaussianaAlta);
%inversa = ifft2(GaussianaBaixa);
%
%inversa = ifft2(idealAlta);
%inversa = ifft2(idealBaixa);

inversa = abs(inversa);
%inversa = uint8(inversa);
imshow(inversa, []);
