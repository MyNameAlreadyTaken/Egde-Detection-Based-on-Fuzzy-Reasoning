function uTao = tao_edge_detection(I)
    imag = rgb2gray(I);
    [high, width] = size(imag);
    uTao = double(imag);
    Nq = zeros(256, 1);
    NF = 0;
    for j = 2: width - 1
        for i = 2: high - 1
            matrix = [imag(i-1,j-1),imag(i-1,j),imag(i-1,j+1);imag(i,j-1),imag(i,j),imag(i,j+1);imag(i+1,j-1),imag(i+1,j),imag(i+1,j+1)];
            set = [imag(i-1,j-1);imag(i-1,j);imag(i-1,j+1);imag(i,j-1);imag(i,j);imag(i,j+1);imag(i+1,j-1);imag(i+1,j);imag(i+1,j+1)];
            set = unique(set);
            [~, b] = size(set);
            Nq(imag(i,j) + 1) = Nq(imag(i,j) + 1) + 1;
            matrix = double(matrix);
            uTao(i,j) = tao_functions(matrix);
            if b > 2
                NF = NF + b;
            end
        end
    end
    for i = 1: high
        uTao(i,1) = 0;
        uTao(i, width) = 0;
    end
    for j = 1: width
        uTao(1, j) = 0;
        uTao(high, j) = 0;
    end
    for j = 2: width - 1
        for i = 2: high - 1
            if abs(uTao(i-1,j-1)) >= uTao(i,j) && abs(uTao(i-1,j)) >= uTao(i,j) && uTao(i-1,j+1) >= uTao(i,j)
                uTao(i,j) = -uTao(i,j);
            elseif abs(uTao(i-1,j-1)) >= uTao(i,j) && abs(uTao(i,j-1)) >= uTao(i,j) && abs(uTao(i+1,j-1)) >= uTao(i,j)
                uTao(i,j) = -uTao(i,j);
            elseif uTao(i+1,j-1) >= uTao(i,j) && uTao(i+1,j) >= uTao(i,j) && uTao(i+1,j+1) >= uTao(i,j)
                uTao(i,j) = -uTao(i,j);
            elseif abs(uTao(i-1,j+1)) >= uTao(i,j) && uTao(i,j+1) >= uTao(i,j) && uTao(i+1,j+1) >= uTao(i,j)
                uTao(i,j) = -uTao(i,j);
            else
                
            end
        end
    end
    NF = NF / (width * high);
    T = 0;
    for i = 2: 256
        T = T + (i - 1) * Nq(i);
    end
    T = T / (Nq(1) * (1 - NF)^8 + sum(Nq, 'all'));
    T = T / 255;
    for i = 2: high - 1
        for j = 2: width - 1
            if uTao(i,j) > T
                uTao(i,j) = 255;
            else
                uTao(i,j) = 0;
            end
        end
    end
    
end

