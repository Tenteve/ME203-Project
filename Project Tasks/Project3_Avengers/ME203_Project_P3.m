clc; clear all; format compact;

%% this is a check to see if every function works
data=get_words('Thor.txt'); %must be a string .txt 
Output=remove_delim(data); %removes .,!? and lowercases it
[data_filtered,L] = clean_words (Output);
[barx,count]=categorizes_words(data_filtered);
[TOP,subcount]=Top_N (count,barx,1) %this will print more than N amount of top words if it exeeds the amount that there are.