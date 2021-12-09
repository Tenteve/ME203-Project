function Output=remove_delim(data)
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
end