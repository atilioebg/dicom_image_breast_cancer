function [ero] = dil_ero(img,se,iter_dil,iter_ero)

% FUNCAO PARA DILATAR E ERODIR A IMAGEM BINARIZADA DA CLUSTERIZACAO
% ENTRADA:
% img = imagem binarizada da clusterizacao
% se = elemento estruturante
% iter_dil = numero de iteracoes para a dilatacao
% iter_ero = numero de iteracoes para a erosao
% SAIDA:
% dil = imagem dilatada
% ero = imagem erodida

i = 0;
    while i~=iter_dil
            
        %dilatacao imagem pelo elemento estruturante se
        X = imdilate(img,se);
        img = X;
        i = i + 1;
        clear X
    end;
    
i = 0;
    while i~=iter_ero

        Z = imerode(img,se);
        img = Z;
        i = i + 1;
        clear Z
    end;
    
    ero = img;
    clear img
   
end
    
    
