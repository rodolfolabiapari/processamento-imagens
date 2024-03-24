[lin, col] = size (img);

Mat = MatT1 .* MatR .* MatT2;

Pontos = Mat * [1 1 lin lin; 1 col 1 col; 1 1 1 1];

xmin = min(Pontos(1,:));
xmax = max(Pontos(1,:));
ymin = min(Pontos(2,:));
ymax = max(Pontos(2,:));

nimg = zeros(xmax - xmin, ymax - ymin);

[x,y] = meshgrid(1:lin, 1:col);

for i = 1:lin
	for j = 1: col
		Ponto = Mat * [i; j; 1];
		ni = Ponto(1);
		nj = Ponto(2);
		nimg(ni - xmin + 1, nj - ymin + 1)= img(i,j);
	endfor
endfor

nimg = uint8(nimg);



%OUra forma de fazer
linhas  = (xmax-xmin) - lin;
colunas = (ymax-ymin) - col;
nimg(linhas / 2: linhas /2 + lin, colunas/2: colunas/2 + col) = img;
