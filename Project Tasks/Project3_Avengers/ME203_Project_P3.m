clc; clear all; format compact;

%% this is a check to see if every function works
data=get_words('Thor.txt'); %must be a string .txt 
Output=remove_delim(data); %removes .,!? and lowercases it
[data_filtered,L] = clean_words (Output);
[barx,count]=categorizes_words(data_filtered);
[TOP,subcount]=Top_N (count,barx,1) %this will print more than N amount of top words if it exeeds the amount that there are.
function [TOP,subcount]=Top_N (count,barx,N)

TOP_N=maxk(count,N);
i=0;
while i<length(TOP_N)
    i=i+1;
    f=find(count==TOP_N(i));
    if length(f)>1
        for j=1:length(f)
            g(i)=f(j); 
            i=i+1;
            if j==length(f)
                i=i-1;
            end
            
        end
    else
        g(i)=f;
    end
end
TOP=barx(g);
for c=1:length(g)
    subcount(c)=count(g(c));
end
