Q = [1/3 1/10;
     1/10 1/3];
b = [0; 0];
f = @(x) 1/3*x(1)^2 + 1/3*x(2)^2 + 1/5*x(1)*x(2);
grad_f = @(x) Q*x - b;

x0 = [-4; 1];
g0 = grad_f(x0);
d0 = -g0;
xk = x0;
gk = g0;
dk = d0;
iteration = 0;

levels = linspace(-7, 7, 10);
[x, y] = meshgrid(-5:0.1:5);
z = zeros(size(x));
for i = 1:numel(x)
    z(i) = f([x(i); y(i)]);
end
contour(x, y, z, levels);
hold on;

plot(x0(1), x0(2), 'ro');
text(x0(1), x0(2), '  x_0');

while norm(gk) > 1e-6
    alphak = (gk' * gk) / (dk' * Q * dk);
    xk_new = xk + alphak * dk;
    plot([xk(1) xk_new(1)], [xk(2) xk_new(2)], 'b');
    plot(xk_new(1), xk_new(2), 'ro');
    text(xk_new(1), xk_new(2), ['  x_', num2str(iteration+1)]);
    gk_new = grad_f(xk_new);
    betak1 = (gk_new' * gk_new) / (gk' * gk);
    dk_new = -gk_new + betak1 * dk;
    xk = xk_new;
    gk = gk_new;
    dk = dk_new;
    iteration = iteration + 1;
end

plot(xk(1), xk(2), 'gx');
hold off;

disp('Minimum point x:');
disp(xk);
disp('Minimum value f(x):');
disp(xk'*Q*xk/2 - b'*xk);
disp('Number of iterations:');
disp(iteration);