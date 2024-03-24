% diretorios = ['.numbers/num0.jpg', '.numbers/num1.jpg', '.numbers/num2.jpg', '.numbers/num3.jpg', '.numbers/num4.jpg', '.numbers/num5.jpg', '.numbers/num6.jpg', '.numbers/num7.jpg', '.numbers/num8.jpg', '.numbers/num9.jpg'];

imagens = zeros(4800, 7);
etiquetas = zeros(4800);
scales = [0.5, 0.75, 1, 1.25, 1.5, 2];
noise  = [0, 0.01, 0.02, 0.03];
count = 1;

for i = 0:9
    img_orig = imread(strcat('numbers/num', num2str(i), '.jpg'));
    for j = 0:19
        img_lv2 = imrotate(img_orig, randi(400));
        for k = 1:6
           img_lv3 = imresize(img_lv2, scales(k));
           for m = 1:4
               img_lv4 = imnoise(img_lv3, 'salt & pepper', noise(m));
               output = humoments(img_lv4);
               
               imagens(count, :) = output;
               etiquetas(count) = i + 1;
               
               count = count + 1;
           end
        end
    end
end

etiquetas = uint8(etiquetas);

[ train_index , test_index ] = crossvalind ('holdOut', length(imagens));

test_data = imagens(test_index);
train_data = imagens(train_index);
train_label = etiquetas(train_index);

predict = classify (test_data , train_data , train_label)