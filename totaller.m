function totaller( f, thre1, thre2, fX, fY, scale, N )
%{
f = filename(s) string
thre1 = lower threshold = 20
thre2 = upper threshold = 100
fX = X position of center of zoom window
fY = Y position of center of zoom window
keep fX = fY = 0 for no zoom.
scale = fraction of total image that has been zoomed into.
For example, 1 is total image and 
0.5 means you are looking through a window of 0.5 times smaller than total image
N = no. of images to scan
keep N = 0 for all images
%}
cd ../
filenames = dir(f);
if N==0
    N = length(filenames);
end
cd abhijeetCode
finalmat = imgprocess(filenames(1).name, thre1, thre2, fX, fY, scale );
if N>1
    for x = 2:N
        finalmat = finalmat + imgprocess(filenames(x).name, thre1, thre2, fX, fY, scale);
    end
end
figure,imagesc(finalmat);
end
