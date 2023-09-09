function proj = projection_Ball(x, center, radius)
    distance = norm(x - center);
    
    if distance <= radius
        proj = x;
    else
        proj = center + radius * (x - center) / distance;
    end
end