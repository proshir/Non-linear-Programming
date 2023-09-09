%gradient_projection_method(tol, x0, projection, stepSize, gradient, func)

% Example 1
% F: Quadratic function | C: Rn+ | tk = 0.1

tolerance = 1e-6;
x0 = [1; 0.1];
x = gradient_projection_method(tolerance, x0, @projection_Rnp, ...
    @(x) 0.1, @gradient_quadratic, @quadratic);


% Example 2
% F: Quadratic function | C: Box[[1 1],[2 3]] | tk = 0.05
%{
tolerance = 1e-6;
x0 = [1.5; 2.1];
x = gradient_projection_method(tolerance, x0, ... 
    @(x) projection_Box(x, [1;1], [2;3]), ...
    @(x) 0.05, @gradient_quadratic, @quadratic);
%}

% Example 3
% F: Quadratic function | C: B[3,2] | tk = 0.1
%{
tolerance = 1e-6;
x0 = [3.1; 2.1];
center = [3; 3];
x = gradient_projection_method(tolerance, x0, ... 
    @(x) projection_Ball(x, center, 2), ...
    @(x) 0.1, @gradient_quadratic, @quadratic);
%}


