function retval = trapezoid(f, a, b, n)
    retval = 0;
    dif = (b - a) / (n-1);
    for i = 1:n-1
        retval = retval + f(a + dif * i);
    endfor
    retval = dif * retval + (dif / 2) * (f(a) + f(b));
endfunction