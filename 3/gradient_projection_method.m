function x = gradient_projection_method(tol, x0, projection, stepSize, gradient, func)
    x = x0;
    k = 0;
    fprintf('iter_number = %d func = %2.7f x = [%s]  \n', k, ...
        func(x), join(string(x), ','));

    x_vals = x(1);
    y_vals = x(2);
    z_vals = func(x);

    while true
        tk = stepSize(x);
        x_new = projection(x - tk * gradient(x));
        k = k + 1;

        fprintf('iter_number = %d func = %2.7f x = [%s]  \n', k, ...
            func(x_new), join(string(x_new), ','));

        x_vals = [x_vals; x_new(1)];
        y_vals = [y_vals; x_new(2)];
        z_vals = [z_vals; func(x_new)];

        if norm(x - x_new) <= tol
            break;
        end

        x = x_new;
    end

    figure;
    x_min = min(x_vals) - 0.5;
    x_max = max(x_vals) + 0.5;
    y_min = min(y_vals) - 0.5;
    y_max = max(y_vals) + 0.5;
    x = linspace(x_min, x_max, 50);
    y = linspace(y_min, y_max, 50);

    Z = zeros(numel(y), numel(x));
    for i = 1:numel(x)
        for j = 1:numel(y)
            Z(j, i) = func([x(i); y(j)]);
        end
    end

    surf(x, y, Z, 'FaceAlpha', 0.3, 'EdgeColor', 'none');

    hold on;

    scatter3(x_vals, y_vals, z_vals, 50, 'r', 'filled');
    line(x_vals, y_vals, z_vals, 'Color', 'r', 'LineStyle', '-');
    colormap jet;

    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;

end