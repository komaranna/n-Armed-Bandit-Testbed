function nArmedBanditTestbed

epsilon=[0,0.01,0.1];
numberOfEpsilons=length(epsilon);
n=10; % no. of possible actions/arms of the bandit
nSteps=1000; %no. of steps in one play
nRuns=2000;

for optimistIndex=0:0

for epsilonIndex=1:numberOfEpsilons

    QStar=zeros(n,1); %actual value of each action
    Q=zeros(n,nSteps); %approximate values throughout the steps
    k=zeros(n,1); %how many times have we chosen each action
    reward=zeros(nSteps-1,1);
    averageReward=zeros(nSteps-1,1);

    for runs=1:nRuns

        %Assigning actual values to actions randomly, initial values
        %deterministically
        for a=1:n
            QStar(a)=normrnd(0,1);
            if optimistIndex==0
                Q(a,1)=0;
            else
                Q(a,1)=5;
            end
            k(a)=0;
        end

        for step=1:nSteps-1
            %Greedy process, always choosing the action with current highest value
            chosenAction=greedy(Q(:,step),epsilon(epsilonIndex));
            reward(step)=normrnd(QStar(chosenAction),1);
            for a=1:n
                if a==chosenAction
                    Q(a,step+1)=(reward(step)+k(a)*Q(a,step))/(k(a)+1);
                else
                    Q(a,step+1)=Q(a,step);
                end
            end
            k(chosenAction)=k(chosenAction)+1;
            averageReward(step)=averageReward(step)+reward(step)/nRuns;
        end

    end

    hold on
    plot(averageReward)

end

end

hold off

end