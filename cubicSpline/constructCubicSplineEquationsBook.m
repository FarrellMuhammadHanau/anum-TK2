function [A, b] = constructCubicSplineEquationsBook(x, y)
    if length(x) != length(y)
        error("x and y must have equal lengths");
    endif

    n = length(x);
    mSize = 4 * (n-1);
    A = zeros(mSize, mSize);
    b = zeros(mSize, 1);

    % Interpolate data point and make function continous
    row = 1;
    col = 1;
    for i = 1:n-1
        A(row, col:col+3) = [1, x(i), x(i)^2, x(i)^3];
        A(row+1, col:col+3) = [1, x(i+1), x(i+1)^2, x(i+1)^3];
        b(row) = y(i);
        b(row+1) = y(i+1);
        row += 2;
        col += 4;
    endfor

    % Continous first derivatives
    col = 2;
    for i = 2:n-1
        A(row, col:col+2) = [1, 2*x(i), 3*x(i)^2];
        col += 4;
        A(row, col:col+2) = [-1, -2*x(i), -3*x(i)^2];
        row += 1;
    endfor

    % Continous second derivatives
    col = 3;
    for i = 2:n-1
        A(row, col:col+1) = [2, 6*x(i)];
        col += 4;
        A(row, col:col+1) = [-2, -6*x(i)];
        row += 1;
    endfor

    % Natural spline condition
    col = 3;
    A(row, col:col+1) = [2, 6*x(1)];
    row += 1;
    col += 4 * (n-2);
    A(row, col:col+1) = [2, 6*x(end)];

    % Parabolic runout condition
    %{
    col = 3;
    A(row, col:col+1) = [2, 6*x(1)];
    col += 4;
    A(row, col:col+1) = [-2, -6*x(2)];
    row += 1;
    col = mSize - 5;
    A(row, col:col+1) = [2, 6*x(end-1)];
    col += 4;
    A(row, col:col+1) = [-2, -6*x(end)];
    %}

    % Not a knot condition
    %{
    col = 4;
    A(row, col) = 6;
    col += 4;
    A(row, col) = -6;
    row += 1;
    col = mSize - 4;
    A(row, col) = 6;
    col += 4;
    A(row, col) = -6;
    %}
endfunction
