%Function to find y for L^Ty=c for given input c.

function [y]=solve_L_T(c) %Defining function solve_L_T
    n=length(c); %Calculation of length of vector c
    y=zeros(n,1); %Creating vector y of same length as c because square matrix L
    for i=1:n %Looping over the rows via backward substitution of prior y(i-1) and replacing that value into y vector
        if i==1 %Finding solution to bottom row
            y(n,1)=c(n)/sqrt((n+1)/n); %Solution for trivial case by rearrangement of bottom row equation
        else
            constant = y(n-i+2)*-1*sqrt((n-i+1)/(n-i+2)); %The value of the j=i+1 part of the row equation upon resubstitution of prior found y solution
            coefficient_ij = sqrt(((n-i+1)+1)/(n-i+1)); %The coefficient where i=j for the below rearrangement
            y(n-i+1,1)=(c(n-i+1)-constant)/coefficient_ij; %Rearrangement of general row equation to solve for each y(n-i+1) (substituting backwards)
        end
    end
end