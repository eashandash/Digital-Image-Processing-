clc
close all

I = im2double(imread('Lena.jpg'));
figure(1),imshow(I);
title('Original Image');

%guassian
PSF = fspecial('motion', 21, 11);
blurred = imfilter(I, PSF, 'conv', 'circular');
%figure, imshow(blurred)

noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', ...
                        noise_mean, noise_var);
figure, imshow(blurred_noisy)
title('Simulated Blur and Noise')

%input image blurred_noisy
estimated_nsr = noise_var / var(I(:));
wnr3 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
figure(3), imshow(wnr3)
title('Restored image');