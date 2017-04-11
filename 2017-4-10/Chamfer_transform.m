image=imread('C:\Users\csie\Desktop\project\2017-4-10\Test_image.png');
temp1=imread('C:\Users\csie\Desktop\project\2017-4-10\Test_image.png');
template=imread('C:\Users\csie\Desktop\project\2017-4-10\Template.png');
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

template_blur=cv.blur(template,'KSize',[3,3]);
template_edge=cv.Canny(template_blur,[50,150]);
for y = 1:size(template_edge,1)
    for x = 1:size(template_edge,2)
        ggg  = 255-template_edge( y, x );
       
         
                    template_edge(y, x) =ggg ;
                    
                
                
        
    end
end

template_edge_dt=cv.distanceTransform(template_edge);
result = conv2(img2,template_edge_dt,'valid');



