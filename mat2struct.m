function W_series = mat2struct()
% This function is used to convert the mat files to a struct.
% which being followed by snr_mat function.
%Usage: W_series = mat2struct
% You should move the .mat files to a same directory,prior to this function
pname = uigetdir();
old_path = pwd;
cd(pname)
display(['current working directory is :' pname]);
mylist = grep('.mat');

W_series = struct('W',[]);
for aa = 1:numel(mylist)
    temp = load(mylist{aa});
    CM  = temp.CM;
    CM(isnan(CM)) = 0;
    W_series(aa).W = CM;
end

cd(old_path)