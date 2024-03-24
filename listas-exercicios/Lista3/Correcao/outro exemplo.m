%juntar duas imagens em uma só
[lin, col] = size(img);

mask = fspecial('gaussian', [lin, col], 60);
mask = mask / max(mask(:));

nimg = img1 .* mask + img2 .* (1 - mask);
