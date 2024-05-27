function retval = simpson(f, a, b, n)
    dif = (b - a) / (n-1);
    xi = a:dif:b;
    retval = 0;
    for i = 2:2:n-1
        retval=retval+(xi(i+1)-xi(i-1))*(f(xi(i-1))+4*f(xi(i))+f(xi(i+1)))/6;
    endfor
endfunction