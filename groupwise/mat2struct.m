function W_series = mat2struct()
% This function is used to convert the mat files to a struct.
% This function is executed after prepCM.m function.
% which being followed by snr_mat function.
%
%Usage: W_series = mat2struct
%
% W_series: includes two fields:
%       W: the connection matrices
%   names: the file name contain the CM
% You should move the .mat files to a same directory, prior to this function
pname = uigetdir();
old_path = pwd;
cd(pname)
display(['current working directory is :' pname]);
mystruc = dir('*.mat');
mylist = struct2cell(mystruc);
mylist = mylist(1,:);
W_series = struct('W',[]);
for aa = 1:numel(mylist)
    temp = load(mylist{aa});
    CM  = temp.CM;
    CM(isnan(CM)) = 0;
    W_series(aa).W = CM;
    W_series(aa).names = mylist{aa};
end

cd(old_path)