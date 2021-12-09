clc; clear all; format compact;


Text = append(input('Enter hero script \n Use underscore for spaces(Ex:Iron_Man): ','s'),'.txt');

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
end

N = input('How many top words would you like to see? (1,2,3...): ');

[AFTop,AFCount,AFL] = AdvFilter(Text,N)

bar(categorical(AFTop),AFCount);
xlabel('Top Words')
ylabel('Count')