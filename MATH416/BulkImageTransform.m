function BulkImageTransform(images, transform, rotated)
    for k = 1:2:length(images)
        ImageTransform(images(k), images(k + 1), transform, rotated);
    end
end