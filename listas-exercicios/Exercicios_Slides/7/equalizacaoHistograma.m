funcion out = equalizacaoHistograma (img)
	out = [];

	[lin col] = size(img);
	totalPixels = lin * col;

	hist = imhist(img) / totalPixels;

	histAcumNorm = cumsum(hist);

	% Acabar de fazer o exercício
end;
