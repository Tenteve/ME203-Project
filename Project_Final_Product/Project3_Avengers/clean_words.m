function [data_filtered,L] = clean_words (data)
% Removes the top most comon words form a cell aray
% https://www.espressoenglish.net/the-100-most-common-words-in-english/
idx = ~ismember(data, {'the' 'of' 'and' 'a' 'to' 'in' 'is' 'you' 'that' 'it' 'he' 'was' 'for' 'on' 'are' 'as' 'with' 'his' 'they' 'i'}); % removes the most comon word

data_filtered=data(idx);
L=length(data_filtered);% length of filtered data array
end

