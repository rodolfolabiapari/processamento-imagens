function [] = Ex3()
  img = imread ("images/lenna_gray512.jpg");
  nimg = altafreq(img,2);
  imshow(uint8(nimg));
end

function nimg = altafreq(img,G)
  [lin,col] = size(img);
  img = double(img);
  nimg = zeros(lin,col);
  mask = ones(3,3)*1/9;
  media = imfilter(img,mask);
  nimg=(1+G)*img-G*media;
 end