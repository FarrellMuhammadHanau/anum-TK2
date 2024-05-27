function retval = simpsonWithTol(f, a, b, tol)
    err = 1;
    n = (b-a) + 1; #Memastikan setidaknya h = 1
    prev = simpson(f, a, b, n);
    while err > tol
        n = n + 2;
        after = simpson(f, a, b, n);
        err = abs(after - prev);
        prev = after;
    endwhile
    retval = prev;
endfunction