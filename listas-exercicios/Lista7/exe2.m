%letra a
A  = imread ('letra_A0.png');
B  = imread ('letra_B.png');
Bt = imread ('letra_Bt.png');
V  = imread ('letra_V.png');

fA  = fft2(A);
fB  = fft2(B);
fBt = fft2(Bt);
fV  = fft2(V);

A30  = imrotate(A,30,'bilinear','crop');
A90  = imrotate(A,90);
A150 = imrotate(A,150,'bilinear','crop');
A270 = imrotate(A,270);

fA30  = fft2(A30);
fA90  = fft2(A90);
fA150 = fft2(A150);
fA270 = fft2(A270);

disp('[INFO] A e A30: ');  disp(hist_inter(abs(fA), abs(fA30)));
disp('[INFO] A e A90: ');  disp(hist_inter(abs(fA), abs(fA90)));
disp('[INFO] A e A150: '); disp(hist_inter(abs(fA), abs(fA150)));
disp('[INFO] A e A270: '); disp(hist_inter(abs(fA), abs(fA270)));
disp('RESPOSTA (A): A transformada de Fourier N?O ? invariante em RELA??O ? ROTA??O');
disp('--------------------');


disp('[INFO] A e B: ');  disp(hist_inter(abs(fA), abs(fB)));
disp('[INFO] A e V: ');  disp(hist_inter(abs(fA), abs(fV)));
disp('[INFO] A e Bt: '); disp(hist_inter(abs(fA), abs(fBt)));
disp('[INFO] B e Bt: '); disp(hist_inter(abs(fB), abs(fBt)));
disp('[INFO] B e V: ');  disp(hist_inter(abs(fB), abs(fV)));
disp('[INFO] Bt e V: '); disp(hist_inter(abs(fBt), abs(fV)));
disp('RESPOSTA (B): RESPOSTA: A transformada de Fourier ? invariante SOMENTE ? TRANSLA??O.');
disp('--------------------');


disp('[INFO] B e Bt: '); disp(hist_inter(abs(fB), abs(fBt)));
disp('RESPOSTA (C): RESPOSTA: A transformada de Fourier ? invariante SOMENTE ? TRANSLA??O.');
disp('--------------------');


pA    = polartrans(A, size(A,1), size(A,2));
pB    = polartrans(B, size(B,1), size(B,2));
pBt   = polartrans(Bt, size(Bt,1), size(Bt,2));
pV    = polartrans(V, size(V,1), size(V,2));
pA30  = polartrans(A30, size(A30,1), size(A30,2));
pA90  = polartrans(A90, size(A90,1), size(A90,2));
pA150 = polartrans(A150, size(A150,1), size(A150,2));
pA270 = polartrans(A270, size(A270,1), size(A270,2));

disp('[COPO] A e A30: ');  disp(hist_inter(abs(pA), abs(pA30)));
disp('[COPO] A e A90: ');  disp(hist_inter(abs(pA), abs(pA90)));
disp('[COPO] A e A150: '); disp(hist_inter(abs(pA), abs(pA150)));
disp('[COPO] A e A270: '); disp(hist_inter(abs(pA), abs(pA270)));
disp('[COPO] A e B: ');    disp(hist_inter(abs(pA), abs(pB)));
disp('[COPO] A e V: ');    disp(hist_inter(abs(pA), abs(pV)));
disp('RESPOSTA (D): Convertendo a imagem para coordenadas polares a transformada de Fourier N?O se torna invariante ? ROTA??O');
disp('--------------------');

