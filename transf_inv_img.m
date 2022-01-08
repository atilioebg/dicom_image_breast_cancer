function [img_matrix] = transf_inv_img(img_col,L,C)

% função para tranformar imagem coluna em imagem matriz
% img_col é a imagem coluna de entrada
% img_matrix é a imagem saida, em forma de matriz
% L e C são o numero de linhas e de colunas, respectivamente, da imagem
% DICOM original

img_matrix = reshape(img_col,C,L);
img_matrix = img_matrix';

end

