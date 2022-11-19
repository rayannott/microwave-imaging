function [vv] = filter_gauss(v)

v = squeeze(abs(v));
limits = [NaN NaN NaN NaN NaN NaN];
[x, y, z, v] = subvolume(v, limits);
V = fftn(v);
gauss_kernell = 
vv = abs(ifftn(V));
end

