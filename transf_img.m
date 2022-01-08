function [img_col] = transf_img(img)

% fun��o para tranformar imagem matrix em imagem coluna
% img � a imagem de entrada
% img_col � a imagem saida, em forma de coluna

img = img';
[l,c] = size(img);
lin = l*c;
img_col=reshape(img,lin,1);

end

