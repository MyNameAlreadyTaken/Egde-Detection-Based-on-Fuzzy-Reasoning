function uPrewitt = prewitt_edge_detection(I, T)
imag = rgb2gray(I);
[high, width] = size(imag);
F2 = double(imag);
U = double(imag);
uPrewitt = imag;
Prewitt_x = [1,1,1; 0,0,0; -1,-1,-1];
Prewitt_y = [-1,0,1; -1,0,1; -1,0,1];
for i = 2: high - 1
    for j = 2: width - 1
        f = [U(i-1,j-1),U(i-1,j),U(i-1,j+1);U(i,j-1),U(i,j),U(i,j+1);U(i+1,j-1),U(i+1,j),U(i+1,j+1)];
        x = Prewitt_x .* f;
        y = Prewitt_y .* f;
        Gx = abs(sum(x, 'all'));
        Gy = abs(sum(y, 'all'));
        uPrewitt(i,j) = max(Gx, Gy);
        %if (uPrewitt(i,j) > 100)
        if (uPrewitt(i,j) > T)
            uPrewitt(i,j) = 255;
        else
            uPrewitt(i,j) = 0;
        end
        %uPrewitt(i,j) = 255;
        %uPrewitt(i,j) = abs(abs(sum(Gx, 'all')) + abs(sum(Gy, 'all')));
        %uPrewitt(i,j) = sqrt(Gx^2 + Gy^2);
    end
end
end

