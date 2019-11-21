function ImageTransform(id, size, transform)
    infile = strcat('F:\MATLAB images\image_', id, '_', size, 'x', size, '.jpg');
    outfile = strcat('F:\MATLAB images\image_', id, '_', size, 'x', size, '_transformed_rot90.jpg');
    in_image = imread(infile);
    in_image = rot90(in_image);
    rgb_image = in_image;
    grayscale_image = rgb2gray(rgb_image);
    transformed_image = transform(grayscale_image);
    normed_image = abs(transformed_image);
    %log_image = log(normed_image);
    scaled_image = scale(normed_image, 255);
    floored_image = floor(scaled_image);
    out_image = floored_image;
    imwrite(out_image, outfile);
end

function M = scale(m, new_max)
    t = max(max(m));
    M = m * (new_max / t);
end