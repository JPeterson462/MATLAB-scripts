function [t, iters] = NewtonsMethod(f, df, x0, goal, e)
    t = x0;
    iters = 0;
    while abs(goal - t) > e
        iters = iters + 1;
        t = t - f(t)/df(t);
    end
end