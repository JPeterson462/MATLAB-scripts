function n = MatchOrientation(M, rot0, rot90, rot180, rot270)
    n = 0;
    FullScore(M, rot0);
    FullScore(M, rot90);
    FullScore(M, rot180);
    FullScore(M, rot270);
end

function FullScore(M, rot)
    disp('Full Score');
    disp([ Score(M, rot, 1) Score(M, rot, 2); Score(M, rot, 3) Score(M, rot, 4) ]);
end

function s = Score(M, rot, q)
    s = 0;
    if q == 1
        for m = 1:5
            for n = 1:size(M, 1)
                if  M(m, n) ~= rot(m, n)
                    s = s + 1;
                end
            end
        end
    elseif q == 2
        for n = 1:5
            for m = 1:size(M, 2)
                if M(m, n) ~= rot(m, n)
                    s = s + 1;
                end
            end
        end
    elseif q == 3
        for m = size(M, 2)-5:size(M, 2)
            for n = 1:size(M, 1)
                if  M(m, n) ~= rot(m, n)
                    s = s + 1;
                end
            end
        end
    elseif q == 4
        for n = size(M, 1)-5:size(M, 1)
            for m = 1:size(M, 2)
                if M(m, n) ~= rot(m, n)
                    s = s + 1;
                end
            end
        end
    end
end