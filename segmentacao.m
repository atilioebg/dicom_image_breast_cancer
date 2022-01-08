function [F] = segmentacao(arquivo,pasta)

path(path,pasta);

image_in = dicomread(arquivo);

[F] = main(image_in,8,0,80,4,1,ones(3),25,1.3,8);
save resultado_segmentacao F
clear image_in


end