img = imread('mars_moon.png');h_final = load('histograma.txt');[lin, col] = size(img);nh = imhist(img) / (lin * col); % ou prod(size(img))cdf1 = cumsum(nh);cdf2 = cumsum(h_final);M = zeros(1, 256);for i = 1:256   temp = abs(cdf1(i) - cdf2);   [v, ind] = min(temp);   M(i) = ind;endnimg = M(img + 1);imshow(uint8(nimg))