function [class_it,vec_dp,vec_media] = kmeans(img,K,num_cts)

% REALIZA CLSUTERIZACAO COM O ALGORITMO K-MEANS

% ENTRADA
% img = imagem de entrada
% K = numero de iterações
% num_cts = numero de clusters

% SAIDA
% clus = imagem clusterizada
% vec_dp = vetor contendo os desvios padrao de cada classe
% vec_media = vetor contendo a media de cada classe

[L,C]=size(img);

%toma o maximo M e minimo m da imagem
M = max(max(img));
m = min(min(img));
 
passo = (M - m)/(num_cts-1);

%centros iniciais dos clusters
cts_ini = [m:passo:M];

clear M
clear m
clear passo

    
    cts = zeros(40,40,num_cts);
    for i = 1:num_cts
        cts(:,:,i) = cts_ini(1,i)*ones(40,40);
    end;
    

    %calcula distancia euclidiana de cada pixel ao centro
    %utilizando o processamento em blocos para uma matriz
                       
    fun = @classif;
    class_ini = blkproc(img,[40 40],fun,cts,num_cts);
    
    clear cts 
    clear fun

    %calcula nova média 
    %[class_ini_col] = transf_img(class_ini);
    %[img_col] = transf_img(img);
    %clear class_ini
        
    vec_media = [];
    for j = 1:num_cts
        [it_media,it_dp] = med_var(img,class_ini, j);
        vec_media = [vec_media it_media];
    end;
    
    
    % processo iteracoes
    k = 0;
    while k < K
        k = k + 1;
        
            cts = zeros(40,40,num_cts);
                for i = 1:num_cts
                    cts(:,:,i) = vec_media(1,i)*ones(40,40);
                end;
    
                %calcula distancia euclidiana de cada pixel ao centro
                %utilizando o processamento em blocos para uma matriz
                       
                fun = @classif;
                class_it = blkproc(img,[40 40],fun,cts,num_cts);
        
                %calcula nova média 
                %[class_it_col] = transf_img(class_it);
                %clear class_it
                
                vec_media = [];
                vec_dp = [];
                    for j = 1:num_cts
                        [it_media,it_dp] = med_var(img,class_it, j);
                        vec_media = [vec_media it_media];
                        vec_dp = [vec_dp it_dp];
                    end;
                
        
    end;
      
end

    
    
            

    
    
    
    
    
    
    
    
    