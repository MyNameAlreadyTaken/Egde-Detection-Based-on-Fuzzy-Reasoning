function [P, R, F] = test(img, test)
    I = test;
    
    [f1, f2] = move(I);
    [P1, R1, F1] = test_func(img, f1);
    [P2, R2, F2] = test_func(img, f2);
    P = 0;
    R = 0;
    F = 0;
    if F1 > F2
        P = P1
        R = R1
        F = F1
    else
        P = P2
        R = R2
        F = F2
    end
end

function [f1, f2] = move(I)
    f1 = I;
    f2 = I;
    [~, width] = size(I);
    f1(:,1) = f1(:,1) + I(:,2);
    for j = 2: width - 1
        f1(:,j) = f1(:,j) + I(:,j+1);
        f2(:,j) = f2(:,j) + I(:,j-1);
    end
    f2(:,width) = f2(:,width) + I(:,width - 1);
end

function [P, R, F] = test_func(img, f)
    TP = 0;
    FP = 0;
    FN = 0;
    TN = 0;
    size(f)
    [high, width] = size(img)
    for j = 2: width - 1
        for i = 2: high - 1
            if img(i,j) ~= 0 && f(i,j) ~= 0
                TP = TP + 1;
            elseif img(i,j) ~= 0 && f(i,j) == 0
                FN = FN + 1;
            elseif img(i,j) == 0 && f(i,j) ~= 0
                FP = FP + 1;
            else
                TN = TN + 1;
            end
        end
    end
    P = TP / (TP + FP);
    R = TP / (TP + FN / 2);
    F = 2 * P * R / (P + R);
end
