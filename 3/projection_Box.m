function proj = projection_Box(x, lower, upper)
    proj = max(min(x, upper), lower);
end