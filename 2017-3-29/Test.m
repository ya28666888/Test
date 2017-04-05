image=imread('C:\Users\csie\Desktop\project\LSCData\A1\plant001_rgb.png');
temp1=imread('C:\Users\csie\Desktop\project\2017-3-29\HHH.png');
pkg load image;
gray_image=rgb2gray(image);
contours=edge(gray_image,'canny');
