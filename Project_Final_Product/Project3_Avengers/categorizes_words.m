function [barx,count]=categorizes_words(dataclean)
[c,~,idx] = unique(dataclean,'stable');
barx=c';
count = hist(idx,unique(idx,'stable'));
end