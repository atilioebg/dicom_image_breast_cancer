function [new_media,new_dp] = med_var(img_col,posicao, M)

    pos_val = find(posicao == M);
    val_img = img_col(pos_val);
    new_media = mean(val_img);
    new_dp = std(val_img);

end

    



