function ImageTransform(id, size, transform, angle)
    infile = strcat('F:\MATLAB images\image_', id, '_', size, 'x', size, '.jpg');
    outfile = strcat('F:\MATLAB images\image_', id, '_', size, 'x', size, '_transformed_rot', int2str(angle),'.jpg');
    grayscale_image = Image2Matrix(infile);
    while angle > 0
        grayscale_image = rot90(grayscale_image);
        angle = angle - 90;
    end
    grayscale_image = rot(angle, grayscale_image);
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

function M = rot(angle, m)
    M = imrotate(m, angle);
    A = size(m, 1); B = size(m, 2);
    C = size(M, 1); D = size(M, 2);
    offset1 = floor((C - A) / 2) + 1;
    offset2 = floor((D - B) / 2) + 1;
    M = M(offset1:offset1+A, offset2:offset2+B);    
end