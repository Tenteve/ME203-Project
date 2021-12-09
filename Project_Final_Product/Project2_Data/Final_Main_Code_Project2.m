% ME203 Final Project
% Project 2 Playing with real data 
% 12/7/2021
% Team 6 - Casey Richards | Jason Vong | Aleksei Simone
 

% VERY IMPORTANT: You need to import Dynamicwind xlsx DATA and t values set
% on NUMERIC MATRIX otherwise this will not work
% Auto-generated by MATLAB on 06-Dec-2021 22:38:41
clc; clear all; format compact;

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 2);

% Specify sheet and range
opts.Sheet = "Dynamic_wind";
opts.DataRange = "B2:C119944";

% Specify column names and types
opts.VariableNames = ["data", "t"];
opts.VariableTypes = ["double", "double"];

% Import the data  IMPORTANT: THIS LOCATION SHOULD BE WHERE YOUR DATA LOCATED
Dynamicwind = readtable("C:\Users\aleks\OneDrive\Documents\MATLAB\Project ME203\Project 2021\Dynamic_wind.xlsx", opts, "UseExcel", false);
% This location is on Aleksei's Laptop for example
%% Convert to output type
Dynamicwind = table2array(Dynamicwind);

%% Tasks
% Task 1
voltage = Dynamicwind(:,1); %pull the data columnn
t =  Dynamicwind(:,2); %pull the t column

% Task 2 
% (volts)
cal_volts=[1.1334761517302536, 1.2168838402316453, 1.2574484652661773, 1.28406653483074, 1.2945098977285117, 1.306963086494241, 1.3147604417015477, 1.3228523686035325, 1.3311519051962617, 1.3343771944501273]; 
% (m/s) 
cal_speed=[0,.31,.53,.68,.73,.84,.90,.96,1.02,1.10]; 

P = polyfit(cal_volts,cal_speed,1); %Use the two arrays to get a best fit line using polyfit

% Task 3
V = polyval(P,voltage);
% Create new array V using polyval and previous elements

% Task 4
T = t(length(t))-t(1);
% This is to find the time the whole experiment was ran in

% Task 5
TIME = linspace(0,T,length(t));
% Now with the length of the experiment create a linearly spaced array.

% Task 6
% Plot Time vs V
figure(1)
plot(TIME,V);
title('Time vs. Voltage')
xlabel('Time')
ylabel('Voltage')


% Task 7 and 8 
Fs = 1/(TIME(2)-TIME(1));  % Frequency
Tf = 1/Fs;                 % Time
L = T*1000;                % Length of signal
tf = (0:L-1)*Tf;           % Time Vector

NFFT = 2^nextpow2(L);      % Next power of 2 from length of L
Y = fft(V,NFFT)/L;         % Fourier Transform function
f = Fs/2*linspace(0,1,NFFT/2+1); 

% Task 9
% Plot frequency and power on a logrithmic scale
figure(2)
loglog(f,2*abs(Y(1:NFFT/2+1))) 
title('Frequency vs. Power')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
xlim([0.06 0.12])
ylim([8e-3 12e-3])

% Task 10
% Find the 3 peaks around the 10^-1 area of the graph and add three text's
% to represent the peaks
text(0.100136,0.0102167,'\leftarrow Peak 1') % Peak 1
text(0.0829699,0.0108303,'\leftarrow Peak 2') % Peak 2
text(0.0669481,0.0111081,'\leftarrow Peak 3') % Peak 3

% Task 11
% Use the 3 frequency values of the peaks and generate a sum of sines
peak1=0.100136; 
peak2=0.0829699;
peak3=0.0669481;
f1=1/peak1;
f2=1/peak2;
f3=1/peak3;
sig=sin(f1.*TIME)+sin(f2.*TIME)+sin(f3.*TIME); %signal

% Task 12
% Plot the signal over 20 seconds
figure(3)
plot(sig(1:20),1:20)
title('Frequency across 20 seconds of the signal')
ylabel('Time')
xlabel('Frequency Hz')



