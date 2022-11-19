clc; clear; close all;

%%
[V_complex_1, xvec_1, yvec_1, zvec_1] = import_volume('../volumes/20221110-111103-088.img');
[V_complex_2, xvec_2, yvec_2, zvec_2] = import_volume('../volumes/20221110-105938-599.img');
[V_complex_3, xvec_3, yvec_3, zvec_3] = import_volume('../volumes/example-1.img');


figure
imshow(V_complex_3(:,:,10))

%%

V_filtered_1 = fft_filtering(V_complex_1);
V_filtered_2 = fft_filtering(V_complex_2);
V_filtered_3 = fft_filtering(V_complex_3);

moving = V_filtered_1(:,:,7);
fixed = V_filtered_2(:,:,7);
reference = V_filtered_3(:, :, 7);

figure
imshow(reference)
%imshow(fixed)
%imshow(moving)
figure
imshowpair(moving, fixed);
[~,movingReg] = imregdemons(moving,fixed,[500 400 200],...
    'AccumulatedFieldSmoothing',1.3);

figure
imshowpair(fixed,movingReg);

figure
imshowpair(fixed,movingReg,'montage');
