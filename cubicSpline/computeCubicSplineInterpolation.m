function yInt = computeCubicSplineInterpolation(x, y, p, t)
    n = length(x);
    for j = 1:n-1
        if x(j) <= t && t <= x(j+1)
            i = j;
            break;
        endif
    endfor
    i = 4*i - 3;
    yInt = p(i) + p(i+1) * t + p(i+2) * t^2 + p(i+3) * t^3;
endfunction
