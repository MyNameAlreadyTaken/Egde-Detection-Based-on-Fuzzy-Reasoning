function uFuzzy = fuzzy_edge_detection(I)
    imag = rgb2gray(I);
    [high, width] = size(imag);
    imag = double(imag);
    uFuzzy = imag;
    total = 0;
    count = 0;
    %t1 = clock;
    for j = 2: width - 1
        for i = 2: high - 1
            matrix = [imag(i-1,j-1),imag(i-1,j),imag(i-1,j+1);imag(i,j-1),imag(i,j),imag(i,j+1);imag(i+1,j-1),imag(i+1,j),imag(i+1,j+1)];
            %matrix2 = [imag2(i-1,j-1),imag2(i-1,j),imag2(i-1,j+1);imag2(i,j-1),imag2(i,j),imag2(i,j+1);imag2(i+1,j-1),imag2(i+1,j),imag2(i+1,j+1)];
            uFuzzy(i,j) = fuzzy_functions(matrix);
        end
    end
    uFuzzy(:,1) = 0;
    uFuzzy(:,width) = 0;
    uFuzzy(1,:) = 0;
    uFuzzy(high,:) = 0;
    %t2 = clock;
    %etime(t2, t1)
    %t1 = clock;
    for j = 2: width - 1
        for i = 2: high - 1
            if abs(uFuzzy(i-1,j-1)) >= uFuzzy(i,j) && abs(uFuzzy(i-1,j)) >= uFuzzy(i,j) && uFuzzy(i-1,j+1) >= uFuzzy(i,j)
                uFuzzy(i,j) = -uFuzzy(i,j);
            elseif abs(uFuzzy(i-1,j-1)) >= uFuzzy(i,j) && abs(uFuzzy(i,j-1)) >= uFuzzy(i,j) && abs(uFuzzy(i+1,j-1)) >= uFuzzy(i,j)
                uFuzzy(i,j) = -uFuzzy(i,j);
            elseif uFuzzy(i+1,j-1) >= uFuzzy(i,j) && uFuzzy(i+1,j) >= uFuzzy(i,j) && uFuzzy(i+1,j+1) >= uFuzzy(i,j)
                uFuzzy(i,j) = -uFuzzy(i,j);
            elseif abs(uFuzzy(i-1,j+1)) >= uFuzzy(i,j) && uFuzzy(i,j+1) >= uFuzzy(i,j) && uFuzzy(i+1,j+1) >= uFuzzy(i,j)
                uFuzzy(i,j) = -uFuzzy(i,j);
            else
                total = total + uFuzzy(i,j);
                count = count + 1;
            end
        end
    end
    %t2 = clock;
    %etime(t2, t1)
%     for j = 2:width - 1
%         if uFuzzy(high - 1, j) < 0
%             uFuzzy(high - 1, j) = 0;
%         end
%     end
    T = total / (count^0.975);
    T = 1.1 * T;
    %uFuzzy
    %t1 = clock;
    for i = 2: high - 1
        for j = 2: width - 1
            if uFuzzy(i,j) > T
                uFuzzy(i,j) = 255;
            else
                uFuzzy(i,j) = 0;
            end
        end
    end
    %t2 = clock;
    %etime(t2, t1)
%     for j = 2: width - 1
%         for i = 2: high - 1
%             if uFuzzy(i-1,j-1) == 255 && uFuzzy(i-1,j) == 255 && uFuzzy(i-1,j+1) == 255
%                 uFuzzy(i,j) = 0;
%             elseif uFuzzy(i-1,j-1) == 255 && uFuzzy(i,j-1) == 255 && uFuzzy(i+1,j-1) == 255
%                 uFuzzy(i,j) = 0;
%             elseif uFuzzy(i+1,j-1) == 255 && uFuzzy(i+1,j) == 255 && uFuzzy(i+1,j+1) == 255
%                 uFuzzy(i,j) = 0;
%             elseif uFuzzy(i-1,j+1) == 255 && uFuzzy(i,j+1) == 255 && uFuzzy(i+1,j+1) == 255
%                 uFuzzy(i,j) = 0;
%             end
%         end
%     end
    %t1 = clock;
    for j = 3: width - 2
        for i = 3: high - 2
            t = 0;
            for k = 0: 4
                t = t + uFuzzy(i-2+k,j-2) + uFuzzy(i-2+k,j+2);
            end
            t = t + uFuzzy(i-2,j-1) + uFuzzy(i-2,j) + uFuzzy(i-2,j+1);
            t = t + uFuzzy(i+2,j-1) + uFuzzy(i+2,j) + uFuzzy(i+2,j+1);
            if t == 0
                uFuzzy(i-1,j-1) = 0;
                uFuzzy(i-1,j) = 0;
                uFuzzy(i-1,j+1) = 0;
                uFuzzy(i,j-1) = 0;
                uFuzzy(i,j) = 0;
                uFuzzy(i,j+1) = 0;
                uFuzzy(i+1,j-1) = 0;
                uFuzzy(i+1,j) = 0;
                uFuzzy(i+1,j+1) = 0;
            end
        end
    end
    %t2 = clock;
    %etime(t2, t1)
end
