function t = AdaptiveIntegration(f, xl, xr, e)
    xm = (xl + xr) / 2;
 	t0 = (xr - xl) * (f(xl) + f(xr)) / 2;
    t1 = (xr - xl) * (f(xl) + 2 * f(xm) + f(xr)) / 4;
    if abs(t0 - t1) < 3 * (xr - xl) * e
        t = t1;
    else
        t = AdaptiveIntegration(f, xl, xm, e) + AdaptiveIntegration(f, xm, xr, e);
    end
end