function nimg = cs(img, m, E)
	img = im2double(img);

	nimg = 1./ (1 + (m./img).^E);

	nimg = uint8(nimg);
endfuction
