image = imread('Test Image 2.jpg');
imshow(image);

hsvImage = rgb2hsv(image);

% Define thresholds for Red color
redMin = [0, 0.4, 0.4]; % Minimum HSV values for Red
redMax = [0.1, 1, 1];   % Maximum HSV values for Red

% Define thresholds for Green color
greenMin = [0.25, 0.4, 0.4];
greenMax = [0.4, 1, 1];

% Define thresholds for Blue color
blueMin = [0.5, 0.4, 0.4];
blueMax = [0.7, 1, 1];

redMask = (hsvImage(:,:,1) >= redMin(1) & hsvImage(:,:,1) <= redMax(1)) & ...
          (hsvImage(:,:,2) >= redMin(2) & hsvImage(:,:,2) <= redMax(2)) & ...
          (hsvImage(:,:,3) >= redMin(3) & hsvImage(:,:,3) <= redMax(3));

greenMask = (hsvImage(:,:,1) >= greenMin(1) & hsvImage(:,:,1) <= greenMax(1)) & ...
            (hsvImage(:,:,2) >= greenMin(2) & hsvImage(:,:,2) <= greenMax(2)) & ...
            (hsvImage(:,:,3) >= greenMin(3) & hsvImage(:,:,3) <= greenMax(3));

blueMask = (hsvImage(:,:,1) >= blueMin(1) & hsvImage(:,:,1) <= blueMax(1)) & ...
           (hsvImage(:,:,2) >= blueMin(2) & hsvImage(:,:,2) <= blueMax(2)) & ...
           (hsvImage(:,:,3) >= blueMin(3) & hsvImage(:,:,3) <= blueMax(3));

% Apply the mask to the original image
redObjects = image;
greenObjects = image;
blueObjects = image;

% Mask non-red areas with black
redObjects(repmat(~redMask, [1, 1, 3])) = 0;
greenObjects(repmat(~greenMask, [1, 1, 3])) = 0;
blueObjects(repmat(~blueMask, [1, 1, 3])) = 0;

% Display the results
figure, imshow(redObjects), title('Red Objects');
figure, imshow(greenObjects), title('Green Objects');
figure, imshow(blueObjects), title('Blue Objects');

redCount = sum(redMask(:));
greenCount = sum(greenMask(:));
blueCount = sum(blueMask(:));

fprintf('Red pixels: %d\n', redCount);
fprintf('Green pixels: %d\n', greenCount);
fprintf('Blue pixels: %d\n', blueCount);
