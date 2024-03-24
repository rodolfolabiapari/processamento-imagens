function [] = Ex1()
  img = imread ("images/lennaRuidoP.png");
  imshow(uint8(img));
  #mediana
  nimg = medfilt2(img);
  figure;
  imshow(uint8(nimg));
  #media
  mask = ones(3,3)*1/9; 
  nimg2 = imfilter(img,mask);
  figure;
  imshow(uint8(nimg2)); 
  #fourier
  nimg3 = fft2(img);
  aux=fftshift(nimg3);
  aux(88-10:88+10,88-10:88+10)=0;
  aux(170-10:170+10,170-10:170+10)=0;
  figure;
  imshow(log(abs(aux)+1),[]); 
  nimg4=ifft2(aux);
  figure;
  imshow(abs(nimg4),[]);
end
