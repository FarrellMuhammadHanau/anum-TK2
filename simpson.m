function retval = simpson(f, a, b, n)
    dif = (b - a) / (n-1);

    ganjil = 0;
    for i = 1:((n - 1)/2)
        ganjil = ganjil + f(a + dif * (2 * i - 1));
    endfor

    genap = 0;
    for i = 1:((n - 1)/2 - 1)
        genap = genap + f(a + dif * 2 * i);
    endfor
    
    retval = (dif/3) * (f(a) + f(b) + (4 * ganjil) + (2 * genap));
endfunction