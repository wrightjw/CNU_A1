%Program to plot interpolation points as described on problem sheet

close all %Closing prior graphs
clear all %Clearing prior variables

x=[]; %Creating x plot points for scatter
x_plot=linspace(-10,10,1000); %Creating x plot points array for F(x) plot
f=[]; %Creating F(x) plot points array for scatter
f_plot=zeros(1,1000); %Creating F(x) plot points array of zeros for F(x) plot which will be replaced in loop with calculated values

for i=1:9 %looping over 9 evenly spaced points for scatter
    x(i)=5/2*(i-1)-10; %Appending these x points generated to array
    f(i)=1/(1+x(i)^2); %Appending these F(x) points generated to array
end

for i=1:length(x_plot) %Looping over length of x_plot
f_plot(i)=1/(1+(x_plot(i))^2); %Appending the looped values to f_plot
end

p=polyfit(x,f,8); %Generating coefficients for degree 8 interpolating polynomial
p_ls=polyfit(x,f,4); %Generating coefficients for degree 3 polynomial using least squares 
p_plot=polyval(p,x_plot); %Generating plot points for interpolating polynomial
p_plot_ls=polyval(p_ls,x_plot); %Generating plot points for least squares polynomial
p_spline=spline(x,f,x_plot); %Obtaining cubic spline form

range_max = [max(p_plot),max(p_plot_ls),max(p_spline),max(f_plot),max(f)]; %Creating array of largest values from each plot
range_min = [min(p_plot),min(p_plot_ls),min(p_spline),min(f_plot),max(f)]; %Creating array of smallest values from each plot

%Outline for data plotting taken from MATLAB Primer

scatter(x,f,'k','x'); %Creates scatter plot
hold on %Waiting to plot next plot
plot(x_plot,f_plot,'b',x_plot,p_plot,'r',x_plot,p_plot_ls,'g',x_plot,p_spline,'m'); %Plotting F(x) and interpolation polynomial
title('Runge Solution'); %Labeling graph
xlabel('$x$','Interpreter','latex'); %Labeling x axis
ylabel('$F(x)$','Interpreter','latex'); %Labeling y axis
axis([min(x_plot)-0.1 max(x_plot)+0.1 min(range_min)-0.1 max(range_max)+0.1]); %Scaling axes to largest vector element value of all plotted values with whitespace
l=legend('$(x_i,F(x_i))$ Scatter','$F(x)$','Interpolating Polynomial','Least Squares Polynomial','Cubic Spline'); %Creating legend that labels the plots in the respective order generated.
set(l,'FontSize',10,'Location','South','Interpreter','Latex'); %Changing legend aesthetics - outline taken from Week 5 tutorial sheet.

%2.2
%{
The cubic spline has the closest approximation to F(x) across the
domain. This is due to the curve being constructed by piecewise polynomials 
through the dataset and so these polynomials will better represent F(x)
over the smaller domain. The cubic spline also better approximates the curve 
when the curve is more flat.

The interpolating polynomial seeks to plot a polynomial of n-1 
degree through the n points of the dataset. Near 0 the interpolating 
polynomial has almost as close an appoximation to F(x) as the Cubic spline, 
however has increased error with increased distance from 0.

Least Squares Polynomial has the worst general fit for the function whereby 
its overall shape does not reflect that of F(x). 
This is because it aims to minimise the residuals of the dataset
rather than best approximate the curve through the points of the dataset
themselves. For the same reason the least squares polynomial is the only
one that does not pass through the dataset itself.
%}