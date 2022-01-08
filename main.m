function [F] = main(image_in,cc,LIA,LSA,It,GV,SE,N_CTS,POP,N_D_E)

[img_in] = double(inv_image(image_in));
clear image_in

h = fspecial('gaussian',3,GV);
img_in = imfilter(img_in,h);
clear h
1
[CL,DP,MD] = kmeans(img_in,30,N_CTS);

[IM] = bin_img(CL,img_in,MD,DP,POP,SE,N_D_E,cc,LIA,LSA);

clear DP
clear MD
clear CL
clear GV
clear It
clear LIA
clear LSA
clear N_CTS
clear N_D_E
clear POP
clear cc

%IMG_IN = IM;

%for i = 1 : It
    
   % DIL_IM = imdilate(IMG_IN,SE);
   % IMG_IN = DIL_IM;
    
%end;
    %[EM] = ext_mark(IM,cc);
    
    %[EM_DIL] = ext_mark(DIL_IM,cc);
    
grad = imdilate(img_in, SE) - imerode(img_in, SE);
clear SE
save dados_segmentacao IM grad img_in

%[F]=segment(img_in,grad,IM,EM_DIL);
[F]=segment(img_in,grad,IM);
clear img_in
clear IM
clear grad

end


