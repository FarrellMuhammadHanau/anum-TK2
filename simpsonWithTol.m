function retval = simpsonWithTol(f, a, b, tol)
    err = 1;

    #memastikan setidaknya h = 1 agar kecil
    if mod(b-a, 2) == 2
        n = (b-a) + 1;
    else
        n = (b-a);
    endif

    prev = simpson(f, a, b, n);
    while err > tol
        n = n + 2;
        after = simpson(f, a, b, n);
        err = abs(after - prev);
        prev = after;
    endwhile
    retval = prev;
endfunction