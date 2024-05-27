function [m yF yC] = testForwardCentral()
    a = 1;
    b = 50;
    baseN = 49; # agar h ≈ 4^-m, maka (b - a) = baseN karena h = (b-a) / ((baseN * 4^m - 1))
    m = 1:6;
    for i=m
        yF(1, i) = simpson(@fForward, a, b, baseN * 4^i);
        yC(1, i) = simpson(@fCentral, a, b, baseN * 4^i);
    endfor

endfunction