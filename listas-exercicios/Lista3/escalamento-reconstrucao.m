function out = escalamento2 (img, sx, sy)
	out = [];

	[lin, col] = size(img);

	[x, y]     = meshgrid(1:col, 1:lin);

	matEscala = [sx 0 0;
             	0 sy 0;
             	0  0 1]; #matriz de escala


	ncoord = matEscala * [x(:)' ; y(:)' ; ones(1, lin * col)];

	nX = reshape(ncoord(1,:), lin, col);
	nY = reshape(ncoord(2,;), lin, col);

	out = interp2(x, y, double(img), nX, nY);

	out = uint8(out);
end
