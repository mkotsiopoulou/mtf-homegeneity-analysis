# mtf-homegeneity-analysis
MTF and homogeneity analysis for medical imaging quality control using MATLAB

## Overview
This project focuses on quality control evaluation techniques for medical imaging systems using Modulation Transfer Function (MTF) analysis and homogeneity measurements.

The project includes:
- MTF analysis of a gamma-camera phantom
- Spatial frequenncy evaluation
- Contrast ratio computation
- Homogeneity field analysis
- Amin / Amax computatuin
- Medical image quality assessment

## Technologies
- MATLAB
- Medical Image Processing
- Signal Analysis
- Image Quality Control
- Biomedical Imaging

## Input Data
### Homogeneity Image
![Homogeneity Image](data/homogeneity_image_C9FF1A.gif)
### Phantom Image
![Phantom Image](data/phantom_C9FF1H.gif)

## Results
### Intesity Range Vizualization
![Intesity Range](results/amin_amax_visualization.png)
### MTF and Contrast Ratio Analysis
![MTF Analysis](results/MTF_contrast_ratio.png)

## Methodology
### MTF Analysis
The Modulatoon Transfer Function (MTF) was evaluated using quadrant phantom images with ifferent spatial frequencies of:
- 7 1p/mm
- 6 1p/mm
- 5 1p/mm
- 4 1p/mm
Contrast ratios were calculated using the formula:
(Pmax - Pmin) / (Pmax + Pmin)
### Homogeneity Analysis
Local intensity averages were computed using a 13x13 neighborhood window in order to evaluate image homogeneity.
The following metric was calculated:
(Amax - Amin) / Amax

## Applications
This project can be applied in:
- Medical imaging quality control
- Gamma-camera evaluation
- Biomedical image analysis
- Signal processing
- Imaging system assessment

## Author
Marina Kotsiopoulou
