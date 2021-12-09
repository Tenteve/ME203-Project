function [TOP,subcount,L] = AdvFilter(hero,N)
% data=GETWORDS(hero)
% This function gets the words from a .txt file and stores them as an array
FID =fopen(hero); % Open the file
data = textscan(FID,'%s'); %scan through the file for each word;
fclose(FID); %close the file

%Output=remove_delimiters(data)
% Removes [".",",","?","!"] and lower cases data
% Iterates over each string in data
data=data{1};
for i=1:length(data)
    data(i)=erase(data(i),"."); %Removes "." from every string
    data(i)=erase(data(i),","); %Removes "," from every string
    data(i)=erase(data(i),"?"); %Removes "?" from every string
    data(i)=erase(data(i),"!"); %Removes "!" from every string
    data(i)=lower(data(i)); %lowercases every string
end
Output=data;

% Removes the top most comon words form a cell aray
% https://www.espressoenglish.net/the-100-most-common-words-in-english/
idx = ~ismember(Output, {'the' 'of' 'and' 'a' 'to' 'in' 'is' 'you' 'that' 'it' 'he' 'was' 'for' 'on' 'are' 'as' 'with' 'his' 'they' 'i'}); % removes the most comon word

data_filtered=Output(idx);
L=length(data_filtered);% length of filtered data array

[c,~,idx] = unique(data_filtered,'stable');
barx=c';
count = hist(idx,unique(idx,'stable'));

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