%Dameli Utembayeva and Cynthia Jelke 
function [bestDistance,bestResultDetails, bestLegMatrix, bestMuscleMatrix] = manducaSimulatedAnnealing(temperature)

global minTemp;

global record;

%generates the initial string
[~,currentMuscleSolution] = manducaGenerateInitialSolution();
[currentLegSolution,~] = manducaGenerateInitialSolution();
bestLegMatrix = currentLegSolution;
bestMuscleMatrix = currentMuscleSolution;
iterations = 1;
%while (temperature>= minTemp)
while (iterations <= 1000)
    %generates a neighbor
    %sets run to 0
    run = [0 0 0 0 0 0 0 0 0 0];
    %as long as run = 0 , generate a new neighbor
    while (run ~= 1)
        flag = false;
        %generates a neighbor
        [newLegs,newMuscles] = manducaPermute(temperature,currentLegSolution,currentMuscleSolution);
        %going through the rows
        for i = 1:10
            %going through the columns
            for j = 1:4
                %case when 2 consecutive legs are locked and the muscle
                %between is contracted
                s = (newLegs(i,j) == 1);
                b = (newLegs(i,(j+1)) == 1);
                c = (newMuscles(i,j) == 100);
                if (s && b && c)
                    %resets run to all zeros if bad neighbor
                    run = [0 0 0 0 0 0 0 0 0 0];
                    %resets i and j to 1 if bad neighbor
                    flag = true;
                    break;
                else
                    %sets index of run corresponding to row equal to 1
                    run(i) = 1;
                end
            end
            if(flag)
                break;
            end
        end
       
    end
    %determining the fitness
    deltaS = manducaFitness(newLegs,newMuscles,record) - manducaFitness(currentLegSolution,currentMuscleSolution,record);
    %accepts a better solution
    if (deltaS > 0)
        currentLegSolution = newLegs;
        currentMuscleSolution = newMuscles;
        bestLegMatrix = newLegs;
        bestMuscleMatrix = newMuscles;
        %potentially accepts a worse solution depending on temperature and
        %fitness
    else
        prob = exp(deltaS/temperature);
        if (prob > rand())
            currentLegSolution = newLegs;
            currentMuscleSolution = newMuscles;
            bestLegMatrix = newLegs;
            bestMuscleMatrix = newMuscles;
        end
        %updates the temperature
        temperature = updateTemp(temperature);
        iterations = iterations + 1;
    end
end
[bestDistance,bestResultDetails] = manducaFitness(bestLegMatrix,bestMuscleMatrix,record);
%returns the fitness of the best function
end



function [temperatureUpdated] = updateTemp(currentTemp)
temperatureUpdated = currentTemp*.98;
%this is the temperature function
end


 

 