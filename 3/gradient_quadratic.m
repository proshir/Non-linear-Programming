function grad = gradient_quadratic(x)
    A = [1, 0; 0, 2];
    grad = 2*A*x;
end