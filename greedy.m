function chosenAction=greedy(QStep,epsilon)
%Epsilon-greedy choosing process

if epsilon==0
    [argvalue,chosenAction]=max(QStep); %this picks out first instance of the highest value, I know I should randomize which one to pick
else
    randomNumber=unifrnd(0,1);
    if randomNumber < epsilon
        %explore
        randomNumber2=unifrnd(0,10);
        chosenAction=ceil(randomNumber2);
    else
        %greedy
        [argvalue,chosenAction]=max(QStep);
    end
        
end

end