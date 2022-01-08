function [posicao] = classif(x,cts,num_cts)

dist = [];
    for j = 1:num_cts
        
        temp = abs(cts(:,:,j) - x);
        dist = cat(3,dist,temp);
        
    end;

[valor,posicao] = min(dist,[],3);

end