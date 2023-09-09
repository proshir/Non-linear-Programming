function [xde] = calculate_pce(t, y, lambda, iter, k, s)
    n=length(t);
    L = sparse(n-1, n);
    for i = 1:n-1
        L(i, i) = 1;
        L(i, i+1) = -1;
    end

    mu=zeros(n-1,1);
    for i=1:iter
        mu=mu-0.25*L*(L'*mu)+0.5*(L*y);
        mu=lambda*mu./max(abs(mu),lambda);
        xde=y-0.5*L'*mu;
    end

    figure(k)
    plot(t, xde, s);
end