## n-Armed-Bandit-Testbed

/2016-10-07/

MATLAB code;

Illustrates efficiency of greedy, epsilon-greedy and optimist approaches to the n-armed bandit problem.
We have an n-armed bandit, a version of the 1-armed bandit. Depending on which arm we choose to pull
we receive a different payout/reward for that action. We have several (but finite) tries during a play,
with the goal to maximize our total reward during the whole play. During this process we continually 
update the rewards we assign to different arms, with the goal to find the arm with the highest actual reward.

Greedy algorithm: picks the arm with the current highest reward and sticks with that.

Epsilon-greedy algorithm: explores the different arms with epsilon probability, chooses the current highest reward with (1-epsilon) prob.

There's an initialization option to turn on an "optimist" initial reward setup.

nArmedBanditTestbed.m -- main function;

greedy.m -- function that describes the possible ways of choosing.

epsilon is a row vector with the different epsilon values, epsilon=0 is the greedy algorithm.

Outputs a figure showing the average reward/step for different algorithms.
