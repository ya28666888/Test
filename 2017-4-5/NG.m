image=imread('C:\Users\csie\Desktop\project\LSCData\A1\plant001_rgb.png');
temp1=imread('C:\Users\csie\Desktop\project\LSCData\A1\plant001_rgb.png');
pkg load image;
gray_image=rgb2gray(image);
image_blur=cv.blur(image,'KSize',[3,3]);
temp1_blur=cv.blur(temp1,'KSize',[3,3]);
contours=cv.Canny(image_blur,[50,150]);
img=zeros(530,500);

for y = 1:size(contours,1)
    for x = 1:size(contours,2)
        ggg  = 255-contours( y, x );
       
         
                    contours(y, x) =ggg ;
                    
                
                
        
    end
end

img=cv.distanceTransform(contours);
img2=cv.normalize(img,'NormType','MinMax');
figure(1),imshow(image);
figure(2),imshow(gray_image);
figure(3),imshow(contours);
figure(4),imshow(img2);