function [] = NBS_sub_txt(W_series,snr_thr)
% This function is used to generate the text files for NBS to analyze.
%
% W_series: includes two fields:
%       W: the connection matrices
%   names: the file name contain the CM
% snr_thr: this argument is the logical combined backbone matrix


dirpath = uigetdir();

for aa = 1:numel(W_series)
   [~,tit,~] = fileparts(W_series(aa).names);
   sub_txt = fullfile(dirpath,[tit '.txt']);
   CM = W_series(aa).W;
   
   CM_thr = CM.*snr_thr;
   
   dlmwrite(sub_txt,CM_thr,'delimiter',','); 
end

