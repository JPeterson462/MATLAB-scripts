function M = Image2Matrix(infile)
    in_image = imread(infile);
    rgb_image = in_image;
    if size(rgb_image, 3) == 1
        M = rgb_image;
    else
        M = rgb2gray(rgb_image);
    end
end