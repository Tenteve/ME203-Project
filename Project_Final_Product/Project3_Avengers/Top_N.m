function [TOP,subcount]=Top_N (count,barx,N)

TOP_N=maxk(count,N); %Returns the count of highest repeated values
i=0;
while i<length(TOP_N) %Repeats for as many top words there are
    i=i+1;
    f=find(count==TOP_N(i)); %Returns the index for each top used word
    if length(f)>1  %checks if there are more than 1 top word of N amount
        for j=1:length(f)  %run for as many repeated top words of N amount
            g(i)=f(j);  %Stores g(i) so that it can be indexed for the word
            i=i+1;
            if j==length(f)  %This if statement resets the i for the next N value for the while statement
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
    
