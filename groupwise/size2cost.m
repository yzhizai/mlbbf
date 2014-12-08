function [] = size2cost(snr_1,snr_2)
% This function is to get the optimal network cost ,which based on signal to noise
% matrix. 
%Usage:[] = size2cost(snr_1,snr_2);
%snr_1 & snr_2 is different groups' snr matrices. so the first step is to
%get them.
snr_1(isnan(snr_1)) = 0;
snr_2(isnan(snr_2)) = 0;


figure
hold on
for aa = 0.5:-0.01:0.01
   formula = sprintf('threshold_proportional(snr_1,%i)',aa);
   thr_cm = eval(formula);

   [coms comp_sizes] = get_components(thr_cm);
   y = max(comp_sizes);
   plot(aa,y,'ro')
end

for bb = 0.5:-0.01:0.01
   formula = sprintf('threshold_proportional(snr_2,%i)',bb);
   thr_cm = eval(formula);

   [coms comp_sizes] = get_components(thr_cm);
   y = max(comp_sizes);
   plot(bb,y,'go')
end
xlabel('Network Cost')
ylabel('Size of Largest Component')
axis([0 0.5 0 91])