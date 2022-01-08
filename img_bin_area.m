function  [img_2D] = img_bin_area(L,NUM,area,LIA,LSA,img_old)    

% FUNCAO PARA BINARIZAR IMAGEM DE COMPONENTES CONECTADOS ATRAVES DAS AREAS
% DOS MESMOS
% ENTRADA:
%   L : imagem dos componentes conectados
%   NUM : vetor com o numero de componentes conectados em cada imagem
%   area : area de cada componente conectado
%   LIA : limite inferior para area do componente
%   LSA : limite superior para area do componente
%SAIDA:
%   new_img : imagem binarizada
%   img_2D : imagem composição da imagem "new_img"

    [X,Y] = size(L);

    new_img = zeros(X,Y); 
            
        for u = 1:NUM
        
            [v] = find(L == u);
            A = area(u);
            
                if LIA<A && A<LSA
                    
                    new_img(v) = 1;
                    
                end;
        end;
   
    
    img_2D = new_img + img_old;
    
    T = find(img_2D > 1);
    
    img_2D(T)=1;
    
    
end