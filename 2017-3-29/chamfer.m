//Open the image
Mat image = imread("root");

//Open the shape I want to detect
Mat templ = imread("root");

//There could be a test to check that the images have loaded

//Inicialize the contours image and the gray one
Mat contours;
Mat gray_image;

//Obtain gray image
cvtColor(image, gray_image, CV_RGB2GRAY);

// Reduce the noise with kernel a 3x3 before the canny
blur(image, image, cv::Size(3, 3));
blur(templ, templ, cv::Size(3, 3));

//Canny edge
Canny(image, contours, 10, 350, 3);
Canny(templ, templ, 5, 350, 3);

// Create a new image, for the distance to the nearest edge 
Mat img(image.rows, image.cols, CV_8UC3);

//Change the colour Black->White and White->Black of the canny edge
for (int i = 0; i < contours.rows; i++) {
    for (int j = 0; j < contours.cols; j++) {
        contours.at<Vec3b>(i, j)[0] = 255 - contours.at<Vec3b>(i, j)[0];
        contours.at<Vec3b>(i, j)[1] = 255 - contours.at<Vec3b>(i, j)[1];
        contours.at<Vec3b>(i, j)[2] = 255 - contours.at<Vec3b>(i, j)[2];
        //cout << contours.at<cv::Vec3b>(i, j) << endl;
    }
}

//Calculates the distance to the closest zero pixel for each pixel of the source image
distanceTransform(contours, img, CV_DIST_L2, 3);

//Normalizes the norm or value range of an array
normalize(img, img, 0.0, 1.0, CV_MINMAX);
/*
 * If we want to see the pixels' values
    for (int i = 0; i < contours.rows; i++) {
        for (int j = 0; j < contours.cols; j++) {
            cout << img.at<cv::Vec3b>(i, j) << endl;
        }
    }
 */

// Show the images
namedWindow("Image");
imshow("Image", image);
namedWindow("Gray");
imshow("Gray", gray_image);
namedWindow("canny2");
imshow("canny2", contours);
namedWindow("pixel");
imshow("pixel", img);
namedWindow("templ2");
imshow("templ2",templ);

while (waitKey(33) != 27) {
}