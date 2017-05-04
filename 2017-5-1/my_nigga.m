image=imread('C:\Users\csie\Desktop\project\2017-5-1\01.png');
templ=imread('C:\Users\csie\Desktop\project\2017-5-1\03.png');

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

Score = 9487;
CurrentScore = 0;
BeginX = 0;
BeginY = 0;



for y1=1:(size(img2,1)-size(templ_edge,1))
  for x1=1:(size(img2,2)-size(templ_edge,2))
    for y2=1:size(templ_edge,1)
       for x2=1:size(templ_edge,2)
         if (templ_edge(y2, x2) == 255)
           CurrentScore = CurrentScore + img2(y1+y2, x1+x2);
         end
       end
    end
    if (CurrentScore < Score || Score == 9487)
      Score = CurrentScore;
      BeginX = x1;
      BeginY = y1;
    end
    CurrentScore = 0;
  end
end