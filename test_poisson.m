%Script to plot the numerical solution to solve_poisson.

clear all %Clearing all prior variables
close all %Closing all prior figures

n=32; %Assigning 32 points

y=solve_poisson(n); %Using solve poisson to generate values
y=[0;y;0]; %Appending results of initial conditions
x=linspace(0,1,33); %Creating 33 evenly spaced points across domain for plotting steps of length 1/32

%Plotting functions looked up in Matlab Primer
plot(x,y,'b'); %plotting calculated vector coordinates in blue
axis([0 max(x)+0.01 min(y)-0.01 max(y)+0.01]); %scaling axes to largest vector element with whitespace
title('Numerical Solution to Second-Order Linear Inhomogeneous ODE'); %Making title
xlabel('$x$','interpreter','latex'); %Labelling axis in latex - Use of latex taken from "https://uk.mathworks.com/help/matlab/creating_plots/text-with-mathematical-expressions-using-latex.html"
ylabel('$\psi$','interpreter','latex'); %Labelling axis in latex - Use of latex taken from "https://uk.mathworks.com/help/matlab/creating_plots/text-with-mathematical-expressions-using-latex.html"
