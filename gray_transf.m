function [img_inv] = gray_transf (img)

[img_col] = transf_img(img);
[L,C] = size(img_col);

M = max(img_col);
m = min(img_col);

B = 255/double(M-m);

img_new = zeros(L,C);
img_new = round(B*(double(img_col)-double(m))); 

[L_img,C_img] = size(img);
[img_inv] = transf_inv_img(img_new,L_img,C_img);

end