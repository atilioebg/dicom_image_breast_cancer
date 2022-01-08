function [img_matrix] = transf_inv_img(img_col,L,C)

% fun��o para tranformar imagem coluna em imagem matriz
% img_col � a imagem coluna de entrada
% img_matrix � a imagem saida, em forma de matriz
% L e C s�o o numero de linhas e de colunas, respectivamente, da imagem
% DICOM original

img_matrix = reshape(img_col,C,L);
img_matrix = img_matrix';

end

