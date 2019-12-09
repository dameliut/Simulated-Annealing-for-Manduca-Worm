%Dameli Utembayeva and Cynthia Jelke
global record;
global maxTemp;
global minTemp;
record= 0;
maxTemp = 80;
%maxTemp= 50;

minTemp = 5;

 %[bestDistance,bestResultDetails, bestLegMatrix, bestMuscleMatrix] = manducaSimulatedAnnealing(maxTemp);

iterationsTestFile = 50; 
%how many times we call simulated annealing 
currentDistance = 0; 
for i=1:iterationsTestFile
%pick the number of iterations
[bestDistance,bestResultDetails, bestLegMatrix, bestMuscleMatrix] = manducaSimulatedAnnealing(maxTemp);
   if(bestDistance>currentDistance)
       %compare scores and choose the best one
       current_legs = bestLegMatrix;
       current_muscles= bestMuscleMatrix;
       currentDistance= bestDistance;
  end
 
 end
fprintf("the best score %d ", currentDistance);
current_legs
current_muscles
 