function retval = forwardDifference(f, t)
    h = 10^-10;
    retval = (f(t + h) - f(t)) / h;
endfunction