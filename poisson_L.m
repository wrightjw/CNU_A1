%A function that returns matrix L, as defined by 1.1, for input N

function [L]=poisson_L(N) %defining function poisson_L accepting input "N"

    if N<1 %Testing for appropriate range of N - assuming empty array acceptable result from question for N==1.
        error("N must be greater than or equal to 1.") %error message for wrong range of N - error code taken from documentation.
    else %If N is in desired range
        if mod(N,1)==0 %Testing variable N is integer to see if it has remainder when divided by 1. - idea from poster on "https://uk.mathworks.com/matlabcentral/answers/326094-how-can-i-test-if-an-input-value-is-an-integer"
            L=zeros(N-1); %Creating an (N-1)x(N-1) matrix of zeroes
            for i=1:(N-1) %Looping over the rows
                L(i,i)=sqrt((i+1)/i); %Replacing zero in (i,j) where i=j with required value
                if (i-1)>0 %Loop skips j for j=0 which does not exist
                    L(i,i-1)=-1*sqrt((i-1)/i); %Replacing zero in (i,j) where j=i-1 with required value
                end
            end
        else %If not integer
            error("Must enter an INTEGER.") %error message for non-integer input
        end
    end
end