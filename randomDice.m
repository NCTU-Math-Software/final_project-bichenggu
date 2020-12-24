function randomDice()
    % input: None
    % output: some floats (the probability of winning, losing ,or a tied game)
    %
    % This function can compute the probability of one of the players of
    % winning or losing the dice game. There are two players. 
    %
    %%  You may set two arguments on your own.
    %  one is how many dices player has (player_X_NumOfDice),
    %  and the other is the max point of one dice (player_X_dicePoint).
    %  
    %   At first, player_1_NumOfDice is set to be 9,
    %             player_1_dicePoint is set to be 4,
    %             player_2_NumOfDice is set to be 6,
    %             player_2_dicePoint is set to be 6.    
    
    %% Set initial value (for user)
    player_1_NumOfDice=9;           
    player_1_dicePoint=4;
    
    player_2_NumOfDice=6;
    player_2_dicePoint=6;
    
    %% Computing...
    format long
    mysumW=0;
    mysumT=0;
    mysumL=0;
    P1=num_dice(player_1_NumOfDice,player_1_dicePoint);
    P2=num_dice(player_2_NumOfDice,player_2_dicePoint);
    
    for ii=player_1_NumOfDice:(player_1_NumOfDice*player_1_dicePoint)
        for jj=player_2_NumOfDice:(player_2_NumOfDice*player_2_dicePoint)
            if ii>jj
                mysumW=mysumW+P1(ii)*P2(jj);
            elseif ii==jj
                mysumT=mysumT+P1(ii)*P2(jj);
            else
                mysumL=mysumL+P1(ii)*P2(jj);
            end
        end
    end
    probabilityW=mysumW/(player_2_dicePoint^player_2_NumOfDice)/(player_1_dicePoint^player_1_NumOfDice);
    probabilityT=mysumT/(player_2_dicePoint^player_2_NumOfDice)/(player_1_dicePoint^player_1_NumOfDice);
    probabilityL=mysumL/(player_2_dicePoint^player_2_NumOfDice)/(player_1_dicePoint^player_1_NumOfDice);
    
    %% Set precision and output the result
    ppreW=roundn(probabilityW,-7);
    ppreT=roundn(probabilityT,-7);
    ppreL=roundn(probabilityL,-7);
    digits(9)
    disp('The winning probability of Peter is approximately') 
    disp(vpa(ppreW))
    
    disp('The probability of a tied game is approximately') 
    disp(vpa(ppreT))
    disp('The losing probability of Peter is approximately') 
    disp(vpa(ppreL))
end

function probabibity=num_dice(n,d)   
    %% input: n (how many dices), d (max dice point)
    % output: probabibity(a vector) 
    % Compute how many times do the number between n and n*d appear     
    %
    % A recursive function.
    
    for ii=1:n
        for mm=1:(ii*d)
            p(mm)=0;
        end
        
        if ii==1
            probabibity=ones(1,d);
        else            
            frontPro=num_dice(ii-1,d);
            frontStart=ii-1;
            frontFinal=(ii-1)*d;
            for jj=1:d
                for kk=frontStart:frontFinal
                    p(jj+kk)=p(jj+kk)+frontPro(kk);
                end
            end            
            probabibity=p;                          
        end           
    end
end