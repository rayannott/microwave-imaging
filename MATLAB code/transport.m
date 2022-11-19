%%
clc; clear; close all;

%%
[V_complex, xvec, yvec, zvec] = import_volume('../volumes/example-1.img');
V = abs(V_complex);
V = squeeze(V);
limits = [50 200 50 200 10 20];
[x, y, z, V] = subvolume(V, limits);
%%
V_fft = fftn(V);
%V_fft = fftshift(V_fft);
V_fft(1:100, 1:100, 1:7) = 0;
%V_fft = fftshift(V_fft);
%V_fft = imboxfilt3(V_fft);
V_filtered = ifftn(V_fft);

%%
[fo,vo] = isosurface(x,y,z,V, 0.5);
[fo_fft,vo_fft] = isosurface(x,y,z,V_fft, 0.5);
[fo_filtered,vo_filtered] = isosurface(x,y,z,V_filtered, 0.5);

%%
figure('Name','Volume');
p1 = patch('Faces', fo, 'Vertices', vo);       
p1.FaceColor = 'red';

%%
figure('Name','Fourier Transform');
p1 = patch('Faces', fo_fft, 'Vertices', vo_fft);       
p1.FaceColor = 'red';

%%
figure('Name','Filtered Volume');
p2 = patch('Faces', fo_filtered, 'Vertices', vo_filtered);       
p2.FaceColor = 'red';

%%
figure('Name','Slice');
imshow(V(:, :, 3))
colorbar;

%%
figure('Name','Slice FFT');
imshow(V_fft(:, :, 3))
colorbar;

%%
figure('Name','Slice Filtered');
imshow(V_filtered(:, :, 3))
colorbar;