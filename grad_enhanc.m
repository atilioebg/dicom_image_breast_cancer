function [IMG]=grad_enhanc(img,Y)

M = max(max(img));
lim = Y*M;

[L,C] = size(img);

%[grad_x,grad_y] = gradient(img);
%grad = (grad_x.^2 + grad_y.^2).^0.5;
grad = imdilate(img, ones(3)) - imerode(img, ones(3));

IMG = zeros(L,C);

for i = 1 : L
    for j = 1 : C
        
        V1 = grad(i,j);
        V2 = img(i,j);
        
        if V1>lim
            IMG(i,j) = M;
        else
            IMG(i,j) = V2;
        end;
    end;
end;
end
        
