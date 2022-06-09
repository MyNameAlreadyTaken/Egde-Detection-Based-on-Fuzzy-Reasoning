function uRoberts = roberts_edge_detection(I, T)
imag = rgb2gray(I);
[high, width] = size(imag);
U = double(imag);
uRoberts = imag;
Roberts_x = [1,0; 0,-1];
Roberts_y = [0,-1; 1,0];
for i = 1: high - 1
    for j = 1: width - 1
        f = [U(i,j),U(i,j+1); U(i+1,j),U(i+1,j+1)];
        x = Roberts_x .* f;
        y = Roberts_y .* f;
        Gx = abs(sum(x, 'all'));
        Gy = abs(sum(y, 'all'));
        uRoberts(i,j) = max(Gx, Gy);
        if (uRoberts(i,j) > T)
            uRoberts(i,j) = 255;
        else
            uRoberts(i,j) = 0;
        end
        %uSobel(i,j) = sqrt(Gx^2 + Gy^2);
    end
end
end
