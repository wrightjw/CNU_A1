%A function that returns a vector y for given c, corresponding to Ly=c.

function [y]=solve_L(c) %defining function solve_L taking input vector "c"
    n=length(c); %Calculation of length of vector c
    y=zeros(n,1); %Creating vector y of same length as c because square matrix L
    for i=1:n %Looping over the rows via forward substitution of prior y(i-1) and placing values into y vector.
        if i==1 %Calculating first term in vector y by solving top trivial row equation
            y(i,1)=c(i)/sqrt((i+1)/i); %rearrangement of L(1,1)y(1)=c(1) to solve for y(1) as rest of row are zeros
        else %for 2:n
            coefficient_ij = sqrt((i+1)/i); %The coefficient of the i=j part of the row equation
            constant = y(i-1)*-1*sqrt((i-1)/i); %The value of the j=i-1 part of the row equation upon substitution of prior found y.
            y(i,1) = (c(i)-constant)/coefficient_ij; %Rearrangement of general row equation to solve for each y(i).
        end
    end
end