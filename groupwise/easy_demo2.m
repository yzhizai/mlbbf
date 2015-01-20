
W_series1 = mat2struct();
W_series2 = mat2struct();
load control_sign
snr_1_thr = sig_mat;
load occult_sign
snr_2_thr = sig_mat;

snr_1_thr(snr_1_thr > 0.002) = -1;
snr_1_thr  = snr_1_thr + 1;

snr_2_thr(snr_2_thr > 0.002) = -1;
snr_2_thr  = snr_2_thr + 1;
figure(1)
imshow(logical(snr_1_thr))
figure(2)
imshow(logical(snr_2_thr))

snr_thr = logical(snr_1_thr) | logical(snr_2_thr);
figure(3)
imshow(logical(snr_thr))

NBS_sub_txt(W_series1,snr_thr);
NBS_sub_txt(W_series2,snr_thr);

