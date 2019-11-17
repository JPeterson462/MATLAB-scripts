function X = fastMatFFT2(x)
    X = fftRows(fftCols(x));
end

function X = fftRows(x)
    X = zeros(size(x));
    for k = 1:size(x, 1)
       X(k, :) = fft(x(k, :)); 
    end
end

function X = fftCols(x)
    X = zeros(size(x));
    for k = 1:size(x, 2)
       X(:, k) = fft(x(:, k)); 
    end
end