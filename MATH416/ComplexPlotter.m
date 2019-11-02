function ComplexPlotter(g, v, K, x, f)
    X = PointGenerator(x, K);
    F = f(X)/sqrt(length(X));
    disp(F);
    figure(1);
    hold on
    title([g, ' of ', v, '(k)']);
    xlabel('k = Index of vector');
    ylabel('real(F(X)_k)');
    graph = plot(K, real(F));
    saveas(graph, ['F:\MATLAB figures\', g, '_', v, '_approx_real.png'], 'png');
    hold off
    figure(2);
    hold on
    title([g, ' of ', v, '(k)']);
    xlabel('k = Index of vector');
    ylabel('imag(F(X)_k)');
    graph = plot(K, imag(F));
    saveas(graph, ['F:\MATLAB figures\', g, '_', v, '_approx_imag.png'], 'png');
    hold off
end