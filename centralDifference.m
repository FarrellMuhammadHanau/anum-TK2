function retval = centralDifference(f, t)
    h = 10^-10;
    retval = (f(t + h) - f(t - h)) / (2 * h);
endfunction