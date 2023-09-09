function val = quadratic(x)
    A = [1, 0; 0, 2];
    val = x'*A*x;
end