function [R, n] = romberg(f, a, b, tol)
    err = 1;
    n = 1;
    R(1,1) = (f(a) + f(b)) * (b - a)/2;

    while (err > tol)
        n = n + 1;
        m = 2^(n-1) + 1;
        R(n, 1) = trapezoid(f, a, b, m);
        for j = 2:n
            R(n, j) = (4 ^ (j - 1) * R(n, j - 1) - R(n-1, j-1))/(4^(j - 1) - 1);
        end
        err = abs(R(n, n) - R(n-1, n-1));
    endwhile
endfunction