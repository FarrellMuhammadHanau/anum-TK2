function retval = fForward(t)
    retval = sqrt(forwardDifference(@x, t) ^ 2 + forwardDifference(@y, t) ^ 2);
endfunction