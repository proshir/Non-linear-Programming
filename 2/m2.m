rand('seed', 314);

x = rand(40, 1);
y = rand(40, 1);
class = (2 * x < y + 0.5) + 1;

A1 = [x(class == 1), y(class == 1)];
A2 = [x(class == 2), y(class == 2)];

Xi = [A1; A2];

yi = [ones(size(A1, 1), 1); -ones(size(A2, 1), 1)];

cvx_begin
    variables v(2) a
    minimise(norm(v))
    subject to
        (yi .* (Xi * v + a)) >= 1

cvx_end

fprintf('v = [ ');
fprintf('%2.6f ', v);
fprintf('] a = %2.6f \n', a);

x_line = [min(Xi(:, 1)), max(Xi(:, 1))];
y_line = -(a +v(1) * x_line) / v(2);
plot(x_line, y_line, 'r--', 'LineWidth', 2);

hold on
plot(A1(:, 1), A1(:, 2), '*', 'MarkerSize', 4, 'Color', 'black');
plot(A2(:, 1), A2(:, 2), 'd', 'MarkerSize', 4, 'Color', 'blue');
hold off

axis([0 1 0 1]);

daspect([1 1.5 1]);

