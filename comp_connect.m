function [L,NUM,AREA] = comp_connect(img_in,n)

% FUNCAO PARA ENCONTRAR COMPONENTES CONECTADOS EM IMAGENS BINARIAS
% ENTRADA:
%   img_in : imagem binaria de entrada
%   n : 4 - 8 referente ao tipo de componente conectado
% SAIDA
%   L : imagem dos componentes conectados rotulados
%   NUM : numero de diferentes componentes conectados em cada imagem
%   area : area de cada componente conectado

[l, num] = bwlabel(img_in, n);
AR = [];    
% calculo da area de cada componente conectado
        
        for j = 1 : num
            
            TT = bwarea(l == j);
            AR = [AR;TT];
            
        end;
        
        L = l;
        NUM = num;
        AREA = AR;
        clear l
        clear num
        clear AR
        clear TT
        
end