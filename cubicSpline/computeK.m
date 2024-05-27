function k = computeK(x, y)
    A = constructKLeftSide(x);
    b = constructKRightSide(x, y);
    [L, U] = luBanded(A, 1, 1);
    y = forwardsub(L, b);
    k = backsub(U, y);
    k = [0; k; 0];
endfunction
