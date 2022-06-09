function uSobel = sobel_edge_detection(I, T)
imag = rgb2gray(I);
[high, width] = size(imag);
F2 = double(imag);
U = double(imag);
uSobel = imag;
Sobel_x = [-1,0,1; -2,0,2; -1,0,1];
Sobel_y = [-1,-2,-1; 0,0,0; 1,2,1];
for i = 2: high - 1
    for j = 2: width - 1
        f = [U(i-1,j-1),U(i-1,j),U(i-1,j+1);U(i,j-1),U(i,j),U(i,j+1);U(i+1,j-1),U(i+1,j),U(i+1,j+1)];
        x = Sobel_x .* f;
        y = Sobel_y .* f;
        %Gx = (U(i+1,j-1) + 2*U(i+1,j) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i-1,j) + F2(i-1,j+1));
        %Gy = (U(i-1,j+1) + 2*U(i,j+1) + F2(i+1,j+1)) - (U(i-1,j-1) + 2*U(i,j-1) + F2(i+1,j-1));
        Gx = abs(sum(x, 'all'));
        Gy = abs(sum(y, 'all'));
        uSobel(i,j) = max(Gx, Gy);
        if (uSobel(i,j) > T)
            uSobel(i,j) = 255;
        else
            uSobel(i,j) = 0;
        end
        %uSobel(i,j) = sqrt(Gx^2 + Gy^2);
    end
end
end
