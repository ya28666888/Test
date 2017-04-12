image=imread('C:\Users\csie\Desktop\project\2017-4-10\Test_image.png');
templ=imread('C:\Users\csie\Desktop\project\2017-4-10\Template.png');

pkg load image;
gray_image=rgb2gray(image);
image_blur=cv.blur(image,'KSize',[3,3]);
templ_blur=cv.blur(templ,'KSize',[3,3]);
contours=cv.Canny(image_blur,[50,150]);
templ_edge=cv.Canny(templ_blur,[50,150]);
img=zeros(648,1152);

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





result = conv2(img2,templ_edge,'valid');
[ColumnMin, Y]= min(C);

[Gmin, X]= min(ColumnMin);

min_x = X

min_y = Y(X)




