


%%

f = imread('lemon_4.jpg');
f = imcrop(f,[0 0 2750 2000]);

[r, c, num_ch] = size(f);
N = 10;
r_new = round(r/N);
c_new = round(c/N);
f_new = imresize(f, [r_new, c_new]);
f_new = imgaussfilt(f_new,6.5);

subplot(1,3,2)
imshow(f_new)
subplot(1,3,1)
imshow(f)


ch_min = [44   84   0];
ch_max = [154  247  66];
f_masked = (f_new(:,:,1) >= ch_min(1)) & (f_new(:,:,1) <= ch_max(1)) & ...
           (f_new(:,:,2) >= ch_min(2)) & (f_new(:,:,2) <= ch_max(2)) & ...
           (f_new(:,:,3) >= ch_min(3)) & (f_new(:,:,3) <= ch_max(3));
       
f_masked = uint8(255 * f_masked);
f_new = imgaussfilt(f_new,100.5);

struct_element = offsetstrel('ball',2,0);       
f_masked = imdilate(f_masked, struct_element);
struct_element = offsetstrel('ball',10,0);
f_masked = imdilate(f_masked, struct_element);
       
       
subplot(1,3,3);
imshow(f_masked)







