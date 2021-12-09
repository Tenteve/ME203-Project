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

TOP_N=maxk(count,N); %Returns the count of highest repeated values
i=0;
while i<length(TOP_N) %Repeats for as many top words there are
    i=i+1;
    f=find(count==TOP_N(i)); %Returns the index for each top used word
    if length(f)>1 %checks if there are more than 1 top word of N amount
        for j=1:length(f) %run for as many repeated top words of N amount
            g(i)=f(j);  %Stores g(i) so that it can be indexed for the word
            i=i+1;
            if j==length(f) %This if statement resets the i for the next N value for the while statement
                i=i-1;
            end
            
        end
    else
        g(i)=f; %Stores g(i) so that it can be indexed for the word
    end
end
TOP=barx(g); %indexing
for c=1:length(g) %indexing
    subcount(c)=count(g(c));
end
    
