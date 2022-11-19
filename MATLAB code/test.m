clc; clear; close all;

%%

[v, xvec_3, yvec_3, zvec_3] = import_volume('../volumes/example-1.img');

%%
figure
imshow(v(:,:,10))

%%
vv = filter_gauss(v);

%%
figure
imshow(vv(:,:,10))

%%
sigma = [5, 5, 5]
x = 
h = gaussmf(x, sigma);
imshow(h(:, :, 5));