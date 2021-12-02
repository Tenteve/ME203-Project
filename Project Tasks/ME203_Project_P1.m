% ME203 Project Q1


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

%Whoever makes the first move is player 1
move=input('Player 1 [r,c]:');
r=move(1);
c=move(2);
board(r,c)=1;
text(c,-r,'X','horizontalalignment','center','fontsize',25)
turn=1;
%Begins the loop with player 2's first turn
while turn==1
    move=input('Player 2 [r,c]:');
    r=move(1);
    c=move(2);
    while board(r,c)==abs(1)   %While loop Checks if move is already taken
        move=input('Invalid input Player 2 [r,c]:');
        r=move(1);
        c=move(2);
    end
    board(r,c)=-1;
    text(c,-r,'O','horizontalalignment','center','fontsize',25)
      result=[sum(board),sum(board)]; %These are the winning scenarios
      result(1)=board(1,1)+board(1,2)+board(1,3); 
      result(2)=board(2,1)+board(2,2)+board(2,3);
      result(3)=board(3,1)+board(3,2)+board(3,3);
      result(4)=board(1,1)+board(2,1)+board(3,1);
      result(5)=board(1,2)+board(2,2)+board(3,2);
      result(6)=board(1,3)+board(2,3)+board(3,3);
      result(7)=board(1,1)+board(2,2)+board(3,3);
      result(8)=board(1,3)+board(2,2)+board(3,1);
      if any(result==-3) %Checks for a win by player 2 and ends loop with a win
          disp('Player 2 wins')
          break
      end
      move=input('Player 1 [r,c]:'); %Now player 1's turn is in the loop 
      r=move(1);
      c=move(2);
      while board(r,c)==abs(1)    %While loops Checks if move is already taken
          move=input('Invalid input Player 2 [r,c]:');
          r=move(1);
          c=move(2);
      end
      board(r,c)=1;
      text(c,-r,'X','horizontalalignment','center','fontsize',25)
      result=[sum(board),sum(board)];  %These are the winning scenarios
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
        disp('Tie game')
        break
        end
 end




  
