function [x] = filtroim(img_in,lim)

    [l,c] = size(img_in);
    fun = @(x)  lim<x;
    img = blkproc(img_in,[40 40],fun);
    
    new_img = zeros(l,c);
    clear l
    clear c
    clear fun
    
    save bin_img img
    pos = find(img == 1);
    
    new_img(pos) = img_in(pos);
    clear img
    
    x = new_img;
    clear img_in
end
    

