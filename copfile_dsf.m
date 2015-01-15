function [] = copfile_dsf(filetype,destination)

% destination = 'G:\MXT_DTI\control_sum'; %����Ŀ���ļ���
% filetype = '*.nii';         %����Ҫ�������ļ���ʽ
maindir = pwd;
subdir = dir(maindir);
subdir = subdir(3:end);

for aa = 1:length(subdir)
    if ~subdir(aa).isdir
        continue;
    end
    
    subdirpath = fullfile(maindir,subdir(aa).name,filetype);
    images = dir(subdirpath);
    
    for bb = 1:length(images)
        imagepath = fullfile(maindir,subdir(aa).name,images(bb).name);
        copyfile(imagepath,destination);
    end
end