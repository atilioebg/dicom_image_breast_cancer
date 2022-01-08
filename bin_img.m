function [x] = bin_img(clust,img,vec_media,vec_dp,N,SE,N_D_E,cc,LIA,LSA)
% Funcao para binarizar imagem
% clust = imagem clusterizada de entrada
% img = imagem original de entrada
% vec_media = vetor de medias da imagem clusterizada
% vec_dp = vetor dos desvios padroes da imagem de entrada
% N = numero de desvioes padroes
% x = imagem binarizada XxYxZ (X linhas, Y colunas e Z altura = n° cluster)

[L_clust,C_clust] = size(clust);
T = max(max(clust));

var_sup = vec_media + N*vec_dp;
var_inf = vec_media - N*vec_dp;

img_old = zeros(L_clust,C_clust);

% loop ao longo do numero de cluster para binarizar imagem
for t = 1:T
    A = zeros(L_clust,C_clust);
    % define limite superior e inferior para os pixels
    LS = var_sup(1,t);
    LI = var_inf(1,t);
    % encontra pixels com valor de cluster igual a t
    [pos]= find(clust == t);
    % le na imagem de entrada as posicoes do pixel pertencente ao cluster t
    VAL = img(pos);
        for i = 1 : size(pos,1)
            V = VAL(i);
                if LI<V && V<LS
                    A(pos(i)) = 1;
                end;
        end;
    
    clear LS
    clear LI
    clear pos
    clear VAL
    clear V
    
    [ERO] = dil_ero(A,SE,N_D_E,N_D_E);
    
    clear A
    
    [L,NUM,AREA] = comp_connect(ERO,cc);
    
    clear ERO
    
    [IM] = img_bin_area(L,NUM,AREA,LIA,LSA,img_old);
    
    img_old = IM;    
    clear IM    
        
end;
x = img_old;
clear img_old
end

                
            
        