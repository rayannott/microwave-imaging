function [V_filtered] = fft_filtering(V_complex)
%FFT_FILTERING Summary of this function goes here
%   Detailed explanation goes here

V = abs(V_complex);
V = squeeze(V);
limits = [NaN NaN NaN NaN NaN NaN];
[x, y, z, V] = subvolume(V, limits);
V_fft = fftn(V);
%V_fft = fftshift(V_fft);
V_fft(1:2, 1:2, 1:2) = 0;
%V_fft = fftshift(V_fft);
%V_fft = imboxfilt3(V_fft);
V_filtered = ifftn(V_fft);
V_filtered = abs(V_filtered);

end

