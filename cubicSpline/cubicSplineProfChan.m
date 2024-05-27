function Si = cubicSplineProfChan(x, y, k, t)
    n = length(x);
    for j = 1:n-1
        if x(j) <= t && t <= x(j+1)
            i = j;
            break;
        endif
    endfor
    Ai = ((y(i+1) - y(i)) / (x(i+1) - x(i))) - ((k(i+1) - k(i)) * (x(i+1) - x(i))^2) / 6;
    Bi = y(i) - (k(i) * (x(i) - x(i+1))^2) / 6 - Ai * x(i);
    Si = ((k(i) * (t - x(i+1))^3) / (6*(x(i) - x(i+1)))) + ((k(i+1) * (t-x(i))^3) / (6*(x(i+1)-x(i)))) + Ai*t + Bi;
endfunction
