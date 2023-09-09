function [xde] = calculate_xde(t, y, lambda, k, s)
    n=length(t);
    L = sparse(n-1, n);
    for i = 1:n-1
        L(i, i) = 1;
        L(i, i+1) = -1;
    end

    xde = (speye(n) + lambda * L' * L) \ y(:);

    figure(k)
    plot(t, xde, s);
end