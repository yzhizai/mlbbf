%% preprocessing

W_series1 = mat2struct();
W_series2 = mat2struct();

snr_1 = snr_mat(W_series1);
snr_2 = snr_mat(W_series2);

size2cost(snr_1,snr_2);

%% postpocessing
snr_1_thr = threshold_proportional(snr_1,0.26);
snr_2_thr = threshold_proportional(snr_2,0.26);

snr_thr = logical(snr_1_thr) | logical(snr_2_thr);

NBS_sub_txt(W_series1,snr_thr,'CON');
NBS_sub_txt(W_series2,snr_thr,'PAT');