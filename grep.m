function mycell = grep(str)
% This function imitates the grep function of Linux,
% used to catch the specified files with the str pattern.
mylist = ls;
mylist(isspace(mylist)) = ' ';

mycell = textscan(mylist,'%s','delimiter',' ');

mycell = mycell{:};
idx = strfind(mycell,str);
myvle = zeros(numel(idx),1);
for aa = 1:numel(idx)
    myvle(aa) = sum(idx{aa});
end

mycell(~istrue(myvle)) = [];