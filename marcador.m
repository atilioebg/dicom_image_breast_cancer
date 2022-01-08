function [EM,IM] = marcador(img, vec_media,vec_dp, N)

[img_inv] = inv_image(img);
img = img_inv;

[Limg,Cimg] = size(img);
TS = vec_media + N*vec_dp;
TI = vec_media - N*vec_dp;
T = [TI' TS'];
IMG_EM = img;
IMG_IM = zeros(Limg,Cimg);
 
for i = 1 : 10
    t = T(i,:);
    L = []; C = [];

    [L,C] = find(t(1,1)< img & img < t(1,2));

        for j = 1 : size(L,1)
            x = L(j,1);
            y = C(j,1);
    
            IMG_EM(x,y) = 0;
            IMG_IM(x,y) = 1;
        end;
end;



EM = bwdist(~IMG_EM);
IM = IMG_IM;
end