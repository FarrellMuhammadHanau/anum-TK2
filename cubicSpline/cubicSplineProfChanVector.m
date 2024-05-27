function S = cubicSplineProfChanVector(x, y, t)
    k = computeK(x, y);
    for i = 1:length(t)
        S(i) = cubicSplineProfChan(x, y, k, t(i));
    endfor
endfunction
