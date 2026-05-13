clc; 
close all;
clear; 

% TASK A
image = imread('phantom_C9FF1H.gif');

% Spatial Frequences
spatial_frequencies = [7, 6, 5, 4]; % lp/mm

% MTF & (Pmax - Pmin)/(Pmax + Pmin) 
figure;
hold on;

legend_strings_mtf = cell(1, length(spatial_frequencies));
legend_strings_contrast = cell(1, length(spatial_frequencies));

% Create File
fid = fopen('results.txt', 'w');

% MTF for Each Quadrant/for Each Row/Profile
for i = 1:length(spatial_frequencies)
    quadrant = image((i-1)*size(image,1)/4 + 1 : i*size(image,1)/4, :);
    profile_P = mean(quadrant, 1);
    MTF_values = abs(fft(profile_P)) / max(abs(fft(profile_P)));
    Pmax = max(profile_P);
    Pmin = min(profile_P);
    contrast_ratio = (Pmax - Pmin) / (Pmax + Pmin);
    
    % Plot
    plot(0:(length(MTF_values)-1), MTF_values, 'DisplayName', ['MTF ', num2str(spatial_frequencies(i)), ' lp/mm']);
    plot(i, contrast_ratio, 'o', 'DisplayName', ['Contrast Ratio ', num2str(spatial_frequencies(i)), ' lp/mm']);
    legend_strings_mtf{i} = ['MTF ', num2str(spatial_frequencies(i)), ' lp/mm'];
    legend_strings_contrast{i} = ['Contrast Ratio ', num2str(spatial_frequencies(i)), ' lp/mm'];
    
    % Results
    fprintf(fid, 'Spatial Frequency: %d lp/mm\n', spatial_frequencies(i));
    fprintf(fid, 'MTF Values: ');
    fprintf(fid, '%f ', MTF_values);
    fprintf(fid, '\n');
    fprintf(fid, 'Contrast Ratio (Pmax - Pmin)/(Pmax + Pmin): %f\n\n', contrast_ratio);
end

fclose(fid);
title('MTF and Contrast Ratio for Different Spatial Frequencies');
xlabel('Frequency (cycles/pixel) and Spatial Frequency');
ylabel('MTF and Contrast Ratio');
legend([legend_strings_mtf, legend_strings_contrast], 'Location', 'Best');
hold off;