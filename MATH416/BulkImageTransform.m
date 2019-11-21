function BulkImageTransform(images, transform)
    for k = 1:2:length(images)
        ImageTransform(images(k), images(k + 1), transform);
    end
end