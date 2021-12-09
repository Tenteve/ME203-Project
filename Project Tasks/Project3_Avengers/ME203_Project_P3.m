clc; clear all; format compact;

% User input for Text and N indicating their desired hero and WordCount
Text = append(input('Enter hero script \n Use underscore for spaces(Ex:Iron_Man)\n Try (Avenger_Assemble) for all the Avengers: ','s'),'.txt');

c=["Steve_Rogers.txt" "Tony_Stark.txt" "Thor.txt" "Bruce_Banner.txt" "Natasha_Romanoff.txt" "Clint_Barton.txt"]; %made specifcally for Avengers assemble for a simple for loop

N = input('How many top words would you like to see? (1,2,3...): ');

switch Text
    case 'Captain_America.txt'
        Text='Steve_Rogers.txt'
    case 'Iron_Man.txt'
        Text='Tony_Stark.txt'
    case 'Thor_Odinson.txt'
        Text='Thor.txt'
    case 'Hulk.txt'
        Text='Bruce_Banner.txt'
    case 'Black_Widow.txt'
        Text='Natasha_Romanoff.txt'
    case 'Hawkeye.txt'
        Text='Clint_Barton.txt'
    case 'Avenger_Assemble.txt'
        for i=1:6
            [AFTop,AFCount,AFL(i)] = AdvFilter(c(i),N); %Referback to Line6
            subplot(2,3,i)
            bar(categorical(AFTop),AFCount);
            title(c(i),'Interpreter','none') %The extra interpreter-none makes it so that the Underscore doesnt make it subscript
            xlabel('Top Words')
            ylabel('Count')
        end
        return %Since this case already complete all of the Avengers, this ends the script
end

[AFTop,AFCount,AFL] = AdvFilter(Text,N)

bar(categorical(AFTop),AFCount);
xlabel('Top Words')
ylabel('Count')