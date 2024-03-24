img = imread ("lenna_gray512.jpg");
newimg = alta_freq(img,2);
newimg = uint8(newimg);
imshow(newimg);

function newimg = alta_freq(img,G)
  [lin,col] = size(img);
  img = double(img);
  newimg = zeros(lin,col);

  mask = ones(3,3)*1/9;

  media = imfilter(img,mask);

  newimg=(1+G)*img-G*media;
 end
