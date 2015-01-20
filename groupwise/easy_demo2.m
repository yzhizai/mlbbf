
W_series1 = mat2struct();
W_series2 = mat2struct();
load control_sign
snr_1_thr = sig_mat;
load occult_sign
snr_2_thr = sig_mat;

AA = zeros(size(snr_1_thr));
AA(snr_1_thr < 0.05) = 1;
snr_1_thr  = AA;

BB = zeros(size(snr_2_thr));
BB(snr_2_thr < 0.05) = 1;
snr_2_thr  = BB;
figure(1)
imshow(logical(snr_1_thr))
figure(2)
imshow(logical(snr_2_thr))

snr_thr = logical(snr_1_thr) | logical(snr_2_thr);
figure(3)
imshow(logical(snr_thr))

NBS_sub_txt(W_series1,snr_thr);
NBS_sub_txt(W_series2,snr_thr);

