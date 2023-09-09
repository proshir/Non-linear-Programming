x0 = [0.01; 1];
s = 2;
alpha = 0.25;
beta = 0.5;
epsilon = 1e-5;

a_values = 1./linspace(100, 2000, 20);
iters = zeros(size(a_values));

for i = 1:length(a_values)
    A = [1, 0; 0, a_values(i)];
    
    [x, ~, iter] = gradient_method_backtracking(@(x) x'*A*x, @(x) 2*A*x, x0, s, alpha, beta, epsilon);
    iters(i) = iter;
end

plot(a_values, iters, 'bo-', 'LineWidth', 1.5);
xlabel('a');
ylabel('Number of iterations');
title('Problem 1');
