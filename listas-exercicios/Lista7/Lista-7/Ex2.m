#letra a
A = imread ("images/letra_A0.png"); 
B = imread ("images/letra_B.png");
Bt = imread ("images/letra_Bt.png");
V = imread ("images/letra_V.png");

fA = fft2(A);
fB = fft2(B);
fBt = fft2(Bt);
fV = fft2(V);

disp("A e B: "); 
disp(hist_inter(abs(fA), abs(fB)));
disp("A e V: ");
disp(hist_inter(abs(fA), abs(fV)));
disp("A e Bt: ");
disp(hist_inter(abs(fA), abs(fBt)));
disp("B e Bt: ");
disp(hist_inter(abs(fB), abs(fBt)));
disp("B e V: ");
disp(hist_inter(abs(fB), abs(fV)));
disp("Bt e V: ");
disp(hist_inter(abs(fBt), abs(fV)));

#Letra b 
A30 = imrotate(A,30,"bilinear","crop");
A90 = imrotate(A,90);
A150 = imrotate(A,150,"bilinear","crop");
A270 = imrotate(A,270);

fA30 = fft2(A30);
fA90 = fft2(A90);
fA150 = fft2(A150);
fA270 = fft2(A270);

disp("A e A30: ");
disp(hist_inter(abs(fA), abs(fA30)));
disp("A e A90: ");
disp(hist_inter(abs(fA), abs(fA90)));
disp("A e A150: ");
disp(hist_inter(abs(fA), abs(fA150)));
disp("A e A270: ");
disp(hist_inter(abs(fA), abs(fA270)));
#A transformada de Fourier não é invariante em relação a rotação

#Letra c
#A transformada de Fourier é invariante a translação.

#Letra d
pA = polartrans(A, size(A,1), size(A,2));
pB = polartrans(B, size(B,1), size(B,2));
pBt = polartrans(Bt, size(Bt,1), size(Bt,2));
pV = polartrans(V, size(V,1), size(V,2));
pA30 = polartrans(A30, size(A30,1), size(A30,2));
pA90 = polartrans(A90, size(A90,1), size(A90,2));
pA150 = polartrans(A150, size(A150,1), size(A150,2));
pA270 = polartrans(A270, size(A270,1), size(A270,2));

disp("Coordenadas polares A e A30: ");
disp(hist_inter(abs(pA), abs(pA30)));
disp("Coordenadas polares A e A90: ");
disp(hist_inter(abs(pA), abs(pA90)));
disp("Coordenadas polares A e A150: ");
disp(hist_inter(abs(pA), abs(pA150)));
disp("Coordenadas polares A e A270: ");
disp(hist_inter(abs(pA), abs(pA270)));
disp("Coordenadas polares A e B: ");
disp(hist_inter(abs(pA), abs(pB)));
disp("Coordenadas polares A e V: ");
disp(hist_inter(abs(pA), abs(pV)));
#Convertendo a imagem para coordenadas polares a transformada de Fourier se torna invariante a rotação