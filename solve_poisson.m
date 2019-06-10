%{
Function which accepts a single input N and returns column vector z^T that is the solution to 
(6) as defined in A1.
%}

function [z]=solve_poisson(N) %defining function solve_poisson - I have assumed N input will only be an integer N>1 or else I'd have included conditions similar to poisson_L.
    b=zeros((N-1),1); %Create a column vector b of zeroes of length N-1
    for i=1:(N-1) %Looping over the length of b
        b(i)=-1*N^(-2)*exp(i/N)*sin((2*pi*i)/N); %Changing values of b to desired values corresponding to given equation (10b)
    end
    y=solve_L(b); %Using function to solve Ly=b
    z=solve_L_T(y); %Using function to solve L^Tz=y
end
