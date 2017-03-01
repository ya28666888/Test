for y = 1:size(prt_img,1)
    for x = 1:size(prt_img,2)
        red   = prt_img( y, x, 1 );
        green = prt_img( y, x, 2 );
        blue  = prt_img(y, x, 3);
          if (green < (red * 1.4) || green < (blue * 1.4) )
                avg = (red + green + blue) / 3;
                for z = 1:3
                    prt_img(y, x, z) = avg;
                end
        end
    end
end