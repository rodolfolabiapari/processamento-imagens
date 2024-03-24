% Variaveis Globais dos Exercicios
imagem_original = imread("pumba.jpg");

propriedade_imagem = size(imagem_original);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% EXECICIO 01
exe1 = imagem_original;

for i = 1 : 10000
  exe1(: , :, 1) = (0.299 * exe1(:, :, 1)) + (0.587 * exe1(:, :, 2)) + (0.114 * exe1(:, :, 3));

  exe1(:, :, 2) = exe1(:, :, 1);
  exe1(:, :, 3) = exe1(:, :, 1);
end

imshow(exe1);

%% PERCEBEU-SE QUE AS ITERAÇÕES NÃO AFETAM A IMAGEM EM ESCALA DE CINZA



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% EXERCICIO 02
exe2 = imagem_original;

% REDUÇÃO 1
img_reduzida_1 = exe2(1:4:end, 1:4:end, 1:3);

proporcao = 4;
% REDUÇÃO 2
for i = 1:(512 / proporcao)
  for j = 1:(512 / proporcao)
    img_reduzida_2(i, j, 1) = mean(mean(exe2((i*proporcao)-3:i*proporcao, (j*proporcao)-3:j*proporcao, 1)));
    img_reduzida_2(i, j, 2) = mean(mean(exe2((i*proporcao)-3:i*proporcao, (j*proporcao)-3:j*proporcao, 2)));
    img_reduzida_2(i, j, 3) = mean(mean(exe2((i*proporcao)-3:i*proporcao, (j*proporcao)-3:j*proporcao, 3)));
  end
end


imshow(exe2);
imshow(img_reduzida_1);
imshow(img_reduzida_2);

imwrite(img_reduzida_1, "r1.png");
imwrite(img_reduzida_2, "r2.png");

exe2 = zeros(512, 512, 3);
exe2 = uint8(exe2);

for i = 1:(512 / proporcao)
  for j = 1:(512 / proporcao)
    exe2((i*proporcao)-3:i*proporcao, (j*proporcao)-3:j*proporcao, 1) = img_reduzida_2(i, j, 1);
    exe2((i*proporcao)-3:i*proporcao, (j*proporcao)-3:j*proporcao, 2) = img_reduzida_2(i, j, 2);
    exe2((i*proporcao)-3:i*proporcao, (j*proporcao)-3:j*proporcao, 3) = img_reduzida_2(i, j, 3);
  end
end

imshow(exe2);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% EXERCÍCIO 3
exe3 = imagem_original;

invertida = exe3;

colunas = propriedade_imagem(2);

for j = 1:colunas
  invertida(:, colunas+1-j, :) = exe3(:, j, :);
end

imshow(invertida);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% EXERCÍCIO 4
exe4_png = imread("gray.png");
imwrite(exe4_png, "gray.jpg");

exe4_jpg = imread("gray.jpg");

diferenca = exe4_png .- exe4_jpg;

% FOI POSSÍVEL PERCEBIR SIM DIFERENÇA ENTRE PNG E JPG
% JGP é um formato bem comprimido mais com leve perdas
% PNG é um formato menos comprimido mas com menos perdas e suporte à transparência.
