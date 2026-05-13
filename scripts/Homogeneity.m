clc;
close all;
clear;

% TASK B
I = imread('homogeneity_image_C9FF1A.gif');

% Convert to GrayScale
if size(I, 3) == 3
    I = rgb2gray(I);
end

% Window 13x13
kernel_size = 13;
kernel = ones(kernel_size) / kernel_size^2;
A = conv2(double(I), kernel, 'same');

% Amax/ Amin
Amax = max(A(:));
Amin = min(A(:));
[row_Amin, col_Amin] = find(A == Amin);
[row_Amax, col_Amax] = find(A == Amax);

% (Amax - Amin) / Amax
homogeneity = (Amax - Amin) / Amax;

% Results
fprintf('Amin: %.2f\n', Amin);
fprintf('Exact Place of Amin:\n');
disp([row_Amin, col_Amin]);
fprintf('Amax: %.2f\n', Amax);
fprintf('Exact Place of Amax:\n');
disp([row_Amax, col_Amax]);
fprintf('(Amax - Amin) / Amax: %.4f\n', homogeneity);

% Plot
figure;
imshow(I);
title('Homogeneity Image');
hold on;
plot(col_Amin, row_Amin, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
plot(col_Amax, row_Amax, 'go', 'MarkerSize', 10, 'LineWidth', 2);
hold off;
