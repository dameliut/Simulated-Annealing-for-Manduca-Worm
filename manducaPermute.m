%Dameli Utembayeva and Cynthia Jelke 
function[legs,muscles] = manducaPermute(temperature,initialLegs,initialMuscles)

global maxTemp;
%creates a factor based on temperature
temp = temperature/maxTemp;
elementsLegs = numel(initialLegs);
elementsMuscles = numel(initialMuscles);
%determines and rounds how many indices in the string should be flipped
legsStep = round(temp*elementsLegs);
muscleStep = round(temp*elementsMuscles);
%randomly selects indices to be flipped
indsLegs = randi([1 elementsLegs],1,legsStep);
indsMuscles = randi([1 elementsMuscles],1,muscleStep);
%flips the indices previously determined
legs = flipSA(legsStep,indsLegs,initialLegs,1);
muscles = flipSA(muscleStep, indsMuscles,initialMuscles,100);
legs = cancelNoMovement(legs,1,5,0);
legs = cancelNoMovement(legs,0,5,1);
muscles = cancelNoMovement(muscles,0,4,100);

end
%This function flips the indices in the matrix
function [matrix] = flipSA(step,inds,initialMatrix, flipNumber)
for i = 1:step
    if(initialMatrix(inds(i))==0)
        initialMatrix(inds(i))= flipNumber;
        %flip to either 100 or 1
     else
        initialMatrix(inds(i))=0;
     end
end

matrix = initialMatrix;

end


function [matrix] = cancelNoMovement(matrix,constant,numCols,flipNumber)

for j=1:10
    
    if matrix(j,:) == constant
        %if you you get a row of all 1s or all 0s
        flipQuan = randi(numCols-1);
        %select a random number that will indicate how many things you will
        %flip 
        flipInds = randperm(numCols,flipQuan);
        %generate the indicies that will be fliped 
        for k=1:flipQuan
            
            if matrix(j,flipInds(k))== constant
                %this is where the flipping happens 
                matrix(j,flipInds(k))=flipNumber;
                
            end
            
        end
        
    end
    
end

end



