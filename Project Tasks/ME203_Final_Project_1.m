% ME203 Final Project
% Project 1 Tic Tac Toe 
% 12/6/2021
% Team 6 - Casey Richards | Jason Vong | Aleksei Simone

%% Task 1: User input tic tac toe

%Establish the board
board=zeros(3,3);
figure
plot([.5 3.5],[-1.5 -1.5],'k','linewidth',2);
hold on
plot([.5 3.5],[-2.5 -2.5],'k','linewidth',2)
plot([1.5 1.5],[-.5 -3.5],'k','linewidth',2)
plot([2.5 2.5],[-.5 -3.5],'k','linewidth',2)
hold off
axis off

%Whoever makes the first move is player 1 (X)
move=input('Player 1 [r,c]:'); % input for move by player 1
r=move(1); % row position
c=move(2); % column position
board(r,c)=1; % logical value of player 1
text(c,-r,'X','horizontalalignment','center','fontsize',25) % displaying the (X)
turn=1; % this is to initialize the while loops, they begin after the first turn or turn==1
%Begins the loop with player 2's first turn
while turn==1
    move=input('Player 2 [r,c]:'); % Player 2's move
    r=move(1);
    c=move(2);
    while board(r,c)==1   %While loop Checks if move is already taken by player 1
        move=input('Invalid input Player 2 [r,c]:'); % If move is taken, try again
        r=move(1);
        c=move(2);
    end
        while board(r,c)==-1    %While loops Checks if move is already taken by player 2
          move=input('Invalid input Player 1 [r,c]:'); % If move is taken, try again
          r=move(1);
          c=move(2);
        end
    board(r,c)=-1; % logical value of player 2
    text(c,-r,'O','horizontalalignment','center','fontsize',25) % player 2 is O
      result=[sum(board),sum(board)]; %These are the winning scenarios
      result(1)=board(1,1)+board(1,2)+board(1,3); % any consecutive 3 in a row
      result(2)=board(2,1)+board(2,2)+board(2,3);
      result(3)=board(3,1)+board(3,2)+board(3,3);
      result(4)=board(1,1)+board(2,1)+board(3,1); % any consecutive 3 in a column
      result(5)=board(1,2)+board(2,2)+board(3,2);
      result(6)=board(1,3)+board(2,3)+board(3,3);
      result(7)=board(1,1)+board(2,2)+board(3,3); % any consecutive 3 along a diagonal
      result(8)=board(1,3)+board(2,2)+board(3,1);
      if any(result==-3) % If player 2 gets any 3 consecutive spaces, they win
          disp('Player 2 wins') % Player 2 wins 
          break % ends loop if player 2 wins
      end
      move=input('Player 1 [r,c]:'); %Now player 1's turn is in the loop 
      r=move(1);
      c=move(2);
      while board(r,c)==-1    %While loops Checks if move is already taken by player 2
          move=input('Invalid input Player 1 [r,c]:');
          r=move(1);
          c=move(2);
      end
        while board(r,c)==1    %While loops Checks if move is already taken by player 1
          move=input('Invalid input Player 1 [r,c]:');
          r=move(1);
          c=move(2);
        end
      board(r,c)=1;
      text(c,-r,'X','horizontalalignment','center','fontsize',25)
      result=[sum(board),sum(board)];  %These are the same winning scenarios
      result(1)=board(1,1)+board(1,2)+board(1,3);
      result(2)=board(2,1)+board(2,2)+board(2,3);
      result(3)=board(3,1)+board(3,2)+board(3,3);
      result(4)=board(1,1)+board(2,1)+board(3,1);
      result(5)=board(1,2)+board(2,2)+board(3,2);
      result(6)=board(1,3)+board(2,3)+board(3,3);
      result(7)=board(1,1)+board(2,2)+board(3,3);
      result(8)=board(1,3)+board(2,2)+board(3,1);
      if any(result==3) %Checks for a win by player 1 and ends loop with a win
          disp('Player 1 wins')
          break
      end
        if all(result~=3)&(sum(sum(abs(board)))==9) %Checks for a tie
        disp('Tie game') % If all board spaces fill up then the game ends in a tie
        break
        end
end

%% Task 2: Tic Tac Toe Simulation over 5000 iterations 

Win1=0;
Win2=0;
Tie=0;
GC=0;
for game=1:50
    GC=GC+1;
%Establish the board
board=zeros(3,3);
% figure;
plot([.5 3.5],[-1.5 -1.5],'k','linewidth',2);
hold on;
plot([.5 3.5],[-2.5 -2.5],'k','linewidth',2);
plot([1.5 1.5],[-.5 -3.5],'k','linewidth',2);
plot([2.5 2.5],[-.5 -3.5],'k','linewidth',2);
hold off;
axis off;

%Whoever makes the first move is player 1 (X)
r=randi(3); % row position at random from 1 to 3
c=randi(3); % column position at random from 1 to 3
move=[r c]; % The random move of player 1
board(r,c)=1; % logical value of player 1
text(c,-r,'X','horizontalalignment','center','fontsize',25) % displaying the (X)
turn=1; % this is to initialize the while loops, they begin after the first turn or turn==1
%Begins the loop with player 2's first turn
while turn==1
    r=randi(3); 
    c=randi(3); 
    move=[r c]; 
    while board(r,c)==1   %While loop Checks if move is already taken by player 
            r=randi(3);
            c=randi(3);
            move=[r c];
    end
        while board(r,c)==-1    %While loops Checks if move is already taken by player 2
            r=randi(3); 
            c=randi(3); 
            move=[r c];         
        end
    board(r,c)=-1; % logical value of player 2
    text(c,-r,'O','horizontalalignment','center','fontsize',25) % player 2 is O
      result=[sum(board),sum(board)]; %These are the winning scenarios
      result(1)=board(1,1)+board(1,2)+board(1,3); % any consecutive 3 in a row
      result(2)=board(2,1)+board(2,2)+board(2,3);
      result(3)=board(3,1)+board(3,2)+board(3,3);
      result(4)=board(1,1)+board(2,1)+board(3,1); % any consecutive 3 in a column
      result(5)=board(1,2)+board(2,2)+board(3,2);
      result(6)=board(1,3)+board(2,3)+board(3,3);
      result(7)=board(1,1)+board(2,2)+board(3,3); % any consecutive 3 along a diagonal
      result(8)=board(1,3)+board(2,2)+board(3,1);
      if any(result==-3) % If player 2 gets any 3 consecutive spaces, they win
          disp('Player 2 wins') % Player 2 wins
          Win2=Win2+1;
          break % ends loop if player 2 wins
      end
        r=randi(3); 
        c=randi(3); 
        move=[r c]; 
      while board(r,c)==-1    %While loops Checks if move is already taken by player 2
            r=randi(3); 
            c=randi(3); 
            move=[r c];        
      end
        while board(r,c)==1    %While loops Checks if move is already taken by player 1
            r=randi(3); 
            c=randi(3); 
            move=[r c]; 
        end
      board(r,c)=1;
      text(c,-r,'X','horizontalalignment','center','fontsize',25)
      result=[sum(board),sum(board)];  %These are the same winning scenarios
      result(1)=board(1,1)+board(1,2)+board(1,3);
      result(2)=board(2,1)+board(2,2)+board(2,3);
      result(3)=board(3,1)+board(3,2)+board(3,3);
      result(4)=board(1,1)+board(2,1)+board(3,1);
      result(5)=board(1,2)+board(2,2)+board(3,2);
      result(6)=board(1,3)+board(2,3)+board(3,3);
      result(7)=board(1,1)+board(2,2)+board(3,3);
      result(8)=board(1,3)+board(2,2)+board(3,1);
      if any(result==3) %Checks for a win by player 1 and ends loop with a win
          disp('Player 1 wins')
          Win1=Win1+1;
          break
      end
        if all(result~=3)&(sum(sum(abs(board)))==9) %Checks for a tie
        disp('Tie game') % If all board spaces fill up then the game ends in a tie
        Tie=Tie+1;
        break
        end          
end
end

% Keeping log of winners and ties
W1=Win1 % t=Total amount of wins by player 1
W2=Win2 % Total amount of wins by player 2
T=Tie % total amount of ties
Game_Counter=GC % total amount of games

%Histogram of results
histogram(W1)
hold on
histogram(W2)
histogram(T)
hold off
xlabel('Number of wins and draws')
ylabel('Logical Value (1)')
title('Tic Tac Toe at Random')
legend('Wins of Player 1','Wins of Player 2','Total Ties')


