function [X] = ext_mark(img_in,cc)

[L1,num1] = bwlabel(img_in,cc);

[LIN1,COL1] = size(L1);

T = zeros(LIN1,COL1);

    for i = 1 : num1
        
        [x,y] = find(L1==i);
        
        Mx = max(x);
        mx = min(x);
        My = max(y);
        my = min(y);
        
        T(mx:Mx,my:My) = 1;
        
    end;
    
    [L2,num2] = bwlabel(T,cc);
    [LIN2,COL2] = size(L2);

    T2 = zeros(LIN2,COL2);

    for i = 1 : num2
        
        [x,y] = find(L2==i);
        
        Mx = max(x);
        mx = min(x);
        My = max(y);
        my = min(y);
        
        T2(mx:Mx,my:My) = 1;
        
    end;
    
    X = T2;
   
end