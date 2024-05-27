function retval = fCentral(t)
    retval = sqrt(centralDifference(@x, t) ^ 2 + centralDifference(@y, t) ^ 2);
endfunction