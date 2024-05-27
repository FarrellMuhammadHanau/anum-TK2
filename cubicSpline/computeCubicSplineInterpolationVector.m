function yInt = computeCubicSplineInterpolationVector(x, y, t)
    [A, b] = constructCubicSplineEquationsBook(x, y);
    p = A \ b;
    for i = 1:length(t)
        yInt(i) = computeCubicSplineInterpolation(x, y, p, t(i));
    endfor
endfunction

