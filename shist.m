function[imgout] = shist(imgin)
ymax = single(255);
xmax = single(max(max(imgin)));
xmin = single(min(min(imgin)));
imgout = imgin;
for idx = 1:numel(imgin)
    x = single(imgin(idx));
    imgout(idx) = ((x-xmin) / (xmax - xmin)) * ymax;
end
end