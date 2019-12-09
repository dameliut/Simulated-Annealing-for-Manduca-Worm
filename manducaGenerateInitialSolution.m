%Dameli Utembayeva and Cynthia Jelke 
function [legs, muscles] =  manducaGenerateInitialSolution()
%this function comes up with 2 randomly generated matrices 
legsNumber = 5;
musclesNumber = 4; 
legs = randi([0 1], 10,legsNumber);
muscles = randi([0 1],10,musclesNumber);
%changing the muscles to the matrix of 0 and 100 instead of matrix of 0s
%and 100s
for i = 1: numel(muscles)
    if muscles(i)==1
        %flips 1 to 100 
        muscles(i)=100;
    end
end
 

