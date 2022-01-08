function [F]=segment(img_in,grad,im)

%[L] = size(img_in,1)/10;

%j = 1;
%A2 = [];

%for i = L : L :size(img_in,1)
    
 %   GRAD = grad(j:i,:);
  %  IM = im(j:i,:);
  %  a2 = imimposemin(GRAD, IM);
  %  clear GRAD
  %  clear IM
  %  A2 = [A2;a2];
  %  clear a2
  %  j = j + L;
    
%end;

A2 = imimposemin(grad,im);
clear grad
clear im

WA = watershed(A2);
clear A2

[l,c] = size(img_in);

F = zeros(l,c);
clear l
clear c

F(WA==0) = 1;
clear WA
clear img_in


end