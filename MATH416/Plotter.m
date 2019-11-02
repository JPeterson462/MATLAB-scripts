function Plotter(dx, dy, X1, X2, Y1, Y2)
    figure(1);
    xlim(dx);
    ylim(dy);
    for i=1:length(X1)
        text(Approx(real(Y1(i))), Approx(imag(Y1(i))), num2str(i), 'Color', 'r');
    end
    figure(2);
    xlim(dx);
    ylim(dy);
    for i=1:length(X2)
        text(Approx(real(Y2(i))), Approx(imag(Y2(i))), num2str(i), 'Color', 'b');
    end
end

function result = Approx(x)
    eps = 10^-15;
    if abs(x / eps) < 2
        result = x;
    else
        result = x;
    end
end