function [img_inv] = inv_image(img)
% inverte o efeito de reflecao da imagem, ou seja, picos passam a ser vales
% e vales passam a ser picos
[img_col] = transf_img(img);
[L,C] = size(img_col);

M = max(img_col);
m = min(img_col);
B = M + m;

img_new = zeros(L,C);
img_new = B - img_col;

[L_img,C_img] = size(img);
[img_inv] = transf_inv_img(img_new,L_img,C_img);

end




    