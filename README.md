# imgProcessing
Image processing for ion detection (Matlab)

Instructions for use:

1)Copy and paste the folder "abhijeetCode" (which contains all these files) into the folder containing the images taken by detector.
2)Go to this copied folder in the Matlab software.
3) type:

>>totaller('#filename(s)', #thre1, #thre2, #xPos, #yPos, #scale, #number)

in the console. The arguments are explained below:

#filename(s) is a character string that specifes the name of the image file. For multiple files use '\*' wildcard. For example, if the folder contains images of the names img1.bmp, img2.bmp, img3.bmp, ... use 'img*'

#thre1 is an integer that specifies the lower threshold. Pixels on the image with brightness lower than thre1 will not be read. Recommended value = 20.

#thre2 is an integer that specifies the upper threshold. Recommended value = 100.

For faster processing, it is possible to only analyze a part of the total image (where the useful hits are located) by positioning a window around that area. The part of the image outside the window will be ignored thus making the computation faster. For that one must specify the size of the window and the position of its center.

#xPos is an integer which specifies the x position of center of window. 

#yPos is an integer which specifies the y position of center of window. 

#scale is a fraction which specifies the size of the window. 0.5 means a window with dimensions half of the original image. 1 means size of the full image.

If you do not wish to use the window put #xPos = 0, #yPos = 0 and #scale = 1. If your window goes outside the boundary of the image, an error "matrix out of bounds" will be displayed.

#number is an integer which specifies the number of images to be read. If you put say #number = 10, the program stops after 10 images and gives the result. This is useful when you need to estimate the position of the window. If you do not want any limit on the number of images put #image = 0.
