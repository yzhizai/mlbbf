function [] = mat2matrix()
% this function is used to change the CM.mat to the text filetype .
% you just need to indentify the dir for the program.
pname = uigetdir();
old_path = pwd;
cd(pname)
display(['current working directory is :' pname]);
if exist('txtfiles','dir')
    rmdir('txtfiles','s')
end
mkdir('txtfiles');
mylist = grep('.mat');

for aa = 1:numel(mylist)
    tit_ext = strrep(mylist{aa},'.mat','.txt');
    fname = fullfile(pname,'txtfiles',tit_ext);
    
    S = load(mylist{aa});
    CM = S.CM;
    CM(isnan(CM)) = 0;
    
    dlmwrite(fname,CM,'delimiter',' ');
end

cd(old_path)

display(['current working directory is :' oldpath]);