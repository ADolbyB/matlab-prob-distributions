%*************************************************************************
% Joel M. Brigida
% STA4821-002: 
% Dr. Valentine Aalo
% Homework #4: Due August 1st, 2021
%*************************************************************************
clear;                      % clear saved variables
clc;                        % clear command window

% setup global variables:
Znum = [9 2 3 4 5 6 7 8];   % Z# stored as an array
b = mean(Znum);          	% b = sample interval size (not for gaussian)
var = max(Znum);            % sample variance = mean of Z#
sigma = sqrt(var);          % sample std dev for gaussian calculation

n = 100000;             	% n = number of random samples to generate
m = 60;                     % m = # of intervals for bar graph histogram

%*************************************************************************
%% Problem #1: Uniform Distribution

% Algorithm to generate random variable Q in interval (-b, b):
% X = (2 * b) * U - b
V1 = 2 * b * rand(1, n) - b;   	% rand creates 1 row, n column matrix
Y1 = hist(V1, m) / n;           % hist Y axis becomes relative frequency
X1 = linspace(-b, b, m);        % define X axis for histogram as array

% NOTES:
% 1) hist(Q, m) generates histogram w/ var Q plotted over 'm' intervals
% 2) hist(Q, m) / n changes Y axis to a percentile relative 
%   scale rather than a total count scale.
% 3) Y = hist(Q, m) / n stores numerical values only, not X values for 
%   plot, and Y is stored as an array / vector of length 'm'.
% 4) Defining X1 = linspace(-b , b, m) defines the X axis for the histogram
% as an array.

disp('Uniform Distribution Interval Probabilities:')
disp([X1',Y1']);              % display probabilities for each bin.

% Determine range of intervals for histogram:
x1a = find(-b / 8 <= X1 & X1 <= b / 8);             % Range #1
x2a = find(-b / 4 <= X1 & X1 <= b / 4);             %
x3a = find(-3 * b / 8 <= X1 & X1 <= 3 * b / 8);     %
x4a = find(-b / 2 <= X1 & X1 <= b / 2);             %
x5a = find(-5 * b / 8 <= X1 & X1 <= 5 * b / 8); 	%
x6a = find(-3 * b / 4 <= X1 & X1 <= 3 * b / 4);     %
x7a = find(-7 * b / 8 <= X1 & X1 <= 7 * b / 8);  	%
x8a = find(-b <= X1 & X1 <= b);                     % Range #8

% Determine probability in each range:
P1a = sum(Y1(x1a));
P2a = sum(Y1(x2a));
P3a = sum(Y1(x3a));
P4a = sum(Y1(x4a));
P5a = sum(Y1(x5a));
P6a = sum(Y1(x6a));
P7a = sum(Y1(x7a));
P8a = sum(Y1(x8a));
disp('Uniform Distribution Probabilities:')
disp([P1a,P2a,P3a,P4a,P5a,P6a,P7a,P8a])  % display interval probabilities

% Create And Plot Histogram:
figure(1)             	% 1st Histogram: Standard Uniform

Width = 2 * b / m;   	% 2b = width of plot, m = # of bins
Y1 = Y1 / Width;     	% normalize probability density (total area = 1)
bar(X1, Y1)           	% generate bar chart from -b to b w/ m intervals

hold on;                % add next entries to the same chart:

n1a = find(X1 <= 0);  	% determine negative x values
x1a = X1(n1a);

n2a = find(X1 > 0);   	% determine positive x values
x2a = X1(n2a);

fx1(n1a) = 1 / (2 * b);	% generate 1st half of Uniform chart
fx1(n2a) = 1 / (2 * b);	% generate 2nd half of Uniform chart

plot(X1, fx1, 'r', 'linewidth', 2)      % plot red line for PDF chart
title('Uniform Distribution')           % declare a title for the chart
ylabel('Relative Distribution')         % name y-axis
xlabel('Value of X_i')                  % name x-axis

%*************************************************************************
%% Problem #2: Triangular Distribution

% Algo to generate Random Variable: X = b(U_1 - U_2)
V3 = b * (rand(1, n) - rand(1, n)); % rand creates 1 row, n column matrix
Y3 = hist(V3, m) / n;           % hist Y axis becomes relative frequency
X3 = linspace(-b, b, m);    	% define X axis for histogram as array

disp('Triangular Interval Probabilities:')
disp([X3',Y3'])                 % display probabilities for each bin.

% Determine range of intervals for histogram:
x1c = find(-b / 8 <= X3 & X3 <= b / 8);             % Range #1
x2c = find(-b / 4 <= X3 & X3 <= b / 4);             %
x3c = find(-3 * b / 8 <= X3 & X3 <= 3 * b / 8); 	%
x4c = find(-b / 2 <= X3 & X3 <= b / 2);             %
x5c = find(-5 * b / 8 <= X3 & X3 <= 5 * b / 8); 	%
x6c = find(-3 * b / 4 <= X3 & X3 <= 3 * b / 4);  	%
x7c = find(-7 * b / 8 <= X3 & X3 <= 7 * b / 8); 	%
x8c = find(-b <= X3 & X3 <= b);                     % Range #8

% Determine probability in each range:
P1c = sum(Y3(x1c));
P2c = sum(Y3(x2c));
P3c = sum(Y3(x3c));
P4c = sum(Y3(x4c));
P5c = sum(Y3(x5c));
P6c = sum(Y3(x6c));
P7c = sum(Y3(x7c));
P8c = sum(Y3(x8c));

disp('Triangular Distribution Probabilities:')
disp([P1c,P2c,P3c,P4c,P5c,P6c,P7c,P8c])  % display interval probabilities

% Plot Histogram:
figure(2)                       % 2nd Histogram: Triangular Distribution
Y3 = Y3 / Width;                % normalize prob density (tot area = 1)
bar(X3, Y3)                     % bar chart from -b to b w/ m intervals

hold on;

n1c = find(X3 <= 0);                % determine negative x values
x1c = X3(n1c);
Plot3a = (x1c + b) / (b * b);       % negative PDF line

n2c = find(X3 > 0);                 % determine positive x values
x2c = X3(n2c);
Plot3b = (b - x2c) / (b * b);       % positive PDF line

fx3(n1c) = Plot3a;                  % generate 1st half of triangular PDF
fx3(n2c) = Plot3b;                  % generate 2nd half of triangular PDF
plot(X3, fx3, 'r', 'linewidth', 2)  % plot red triangular PDF line
title('Triangular Distribution')    % declare a title for the chart
ylabel('Relative Distribution')     % name y-axis
xlabel('Value of X_i')              % name x-axis

%*************************************************************************
%% Problem #3: Gaussian Distribution

% Algo to generate Random Variable: X = stddev * (Z)
V2 = sigma * randn(1, n);           % randn creates 1 row, n column matrix
Y2 = hist(V2, m) / n;               % hist Y axis becomes relative frequency

% define X axis for gaussian histogram as +/- 4 standard deviations:
X2 = linspace(-4 * sigma, 4 * sigma, m);

disp('Gaussian Distribution Interval Probabilities:')
disp([X2',Y2']);                    % display probabilities for each bin.

% Determine range of intervals for histogram:
x1b = find(-sigma / 2 <= X2 & X2 <= sigma / 2);        	% Range #1
x2b = find(-sigma <= X2 & X2 <= sigma);                 %
x3b = find(-3 * sigma / 2 <= X2 & X2 <= 3 * sigma / 2);	%
x4b = find(-2 * sigma <= X2 & X2 <= 2 * sigma);        	%
x5b = find(-5 * sigma / 2 <= X2 & X2 <= 5 * sigma / 2);	%
x6b = find(-3 * sigma <= X2 & X2 <= 3 * sigma);         %
x7b = find(-7 * sigma / 2 <= X2 & X2 <= 7 * sigma / 2);	%
x8b = find(-4 * sigma <= X2 & X2 <= 4 * sigma);         % Range #8

% Determine probability in each range:
P1b = sum(Y2(x1b));
P2b = sum(Y2(x2b));
P3b = sum(Y2(x3b));
P4b = sum(Y2(x4b));
P5b = sum(Y2(x5b));
P6b = sum(Y2(x6b));
P7b = sum(Y2(x7b));
P8b = sum(Y2(x8b));
disp('Gaussian Distribution Probabilities:')
disp([P1b,P2b,P3b,P4b,P5b,P6b,P7b,P8b])  % display interval probabilities

% Create And Plot Histogram:
figure(3)             	% 3nd Histogram: Gaussian Distribution

Width2 = 8 * sigma / m;	% 8 * sigma = width of plot, m = # of bins
Y2 = Y2 / Width2;     	% normalize probability density (total area = 1)
bar(X2, Y2)           	% bar chart from -4sigma to 4sigma w/ m intervals

hold on;                % add next entries to the same chart:

n1b = find(X2 <= 0);  	% determine negative x values
x1b = X2(n1b);
Plot2a = (1 / (sqrt(2 * pi * var))) * (exp(-((x1b .* x1b) / (2 * var))));

n2b = find(X2 > 0);   	% determine positive x values
x2b = X2(n2b);
Plot2b = (1 / (sqrt(2 * pi * var))) * (exp(-((x2b .* x2b) / (2 * var))));

fx2(n1b) = Plot2a;      % generate 1st half of Gaussian PDF line
fx2(n2b) = Plot2b;      % generate 2nd half of Gaussian PDF line

plot(X2, fx2, 'r', 'linewidth', 2)      % plot red line for PDF chart
title('Gaussian Distribution')       	% declare a title for the chart
ylabel('Relative Distribution')         % name y-axis
xlabel('Value of X_i')                  % name x-axis

%*************************************************************************
%% Problem #4: Arcsine Distribution

% Algo to generate Random Variable: X = b * sin(pi * (U - (1/2))

V4 = b * sin(pi * (rand(1, n) - 0.5));
Y4 = hist(V4, m) / n;         	% hist Y axis becomes relative frequency
X4 = linspace(-b, b, m);      	% define X axis for histogram as array

disp('Arcsine Interval Probabilities:')
disp([X4',Y4'])                 % display probabilities for each bin.

% Determine range of intervals for histogram:
x1d = find(-b / 8 <= X4 & X4 <= b / 8);             % Range #1
x2d = find(-b / 4 <= X4 & X4 <= b / 4);             %
x3d = find(-3 * b / 8 <= X4 & X4 <= 3 * b / 8);  	%
x4d = find(-b / 2 <= X4 & X4 <= b / 2);             %
x5d = find(-5 * b / 8 <= X4 & X4 <= 5 * b / 8);   	%
x6d = find(-3 * b / 4 <= X4 & X4 <= 3 * b / 4); 	%
x7d = find(-7 * b / 8 <= X4 & X4 <= 7 * b / 8);  	%
x8d = find(-b <= X4 & X4 <= b);                     % Range #8

% Determine probability in each range:
P1d = sum(Y4(x1d));
P2d = sum(Y4(x2d));
P3d = sum(Y4(x3d));
P4d = sum(Y4(x4d));
P5d = sum(Y4(x5d));
P6d = sum(Y4(x6d));
P7d = sum(Y4(x7d));
P8d = sum(Y4(x8d));

disp('Arcsine Distribution Probabilities:')
disp([P1d,P2d,P3d,P4d,P5d,P6d,P7d,P8d])  % display interval probabilities

% Plot Histogram:
figure(4)                       % 4th Histogram: Arcsine Distribution
Y4 = Y4 / Width;             	% normalize prob density (tot area = 1)
bar(X4, Y4)                     % bar chart from -b to b w/ m intervals

hold on;

n1d = find(X4 <= 0);          	% determine negative x values
x1d = X4(n1d);
Plot4a = 1 ./ (pi * sqrt((b * b) - (x1d .* x1d)));

n2d = find(X4 > 0);            	% determine positive x values
x2d = X4(n2d);
Plot4b = 1 ./ (pi * sqrt((b * b) - (x2d .* x2d)));

fx4(n1d) = Plot4a;
fx4(n2d) = Plot4b;
plot(X4, fx4, 'r', 'linewidth', 2)  % plot red triangular PDF line
title('Arcsine Distribution')       % declare a title for the chart
ylabel('Relative Distribution')     % name y-axis
xlabel('Value of X_i')              % name x-axis

%*************************************************************************