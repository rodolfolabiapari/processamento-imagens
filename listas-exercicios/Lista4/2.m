#2 a
function nimg = cs (img, m, E)
  nimg = img;

  nimg = 1 ./ (1 + (m ./ img(: , :)).^E);

  nimg = uint8(nimg);

  figure; imshow(nimg);

endfunction


#2 b
function nimg = pl (img, c, gamma)
  nimg = img;

  nimg = c .* (img(: , :).^gamma);

  nimg = uint8(nimg);

  figure; imshow(nimg);

endfunction


#2 c
function nimg = funct_imadjust(img)
	nimg = imadjust(img);
endfunction
