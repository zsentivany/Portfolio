clc; clear;

%% Group 1
% Zach Sentivany
% Tim Jacino
% Andrew Kolibaba
% Tyler Sullivan

%Performance Analysis software%
%Written by Zach Sentivany%
%% Code

filename = input("Input the name of the excel file to interpret: ","s");
mainTable = xlsread(filename);

m = input("Enter the mass of the AEV, (g): ");
te = mainTable(7:end,1);
ie = mainTable(7:end,2);
ve = mainTable(7:end,3);
marks = mainTable(7:end,4);
pos = mainTable(7:end,5);

%Time equation
t = te / 1000;
 
%Current equation
i = (ie ./ 1024) .* 2.46 .* (1 / 0.185);
 
%Voltage
v = (15 * ve) / 1024;

%Distance
d = 0.0124 * marks;

%Position
s = 0.0124 * pos;

%Power Supplied
p = v .* i;
% p is input power

%incremental energy
for interval = 1 : length(p)-1;
    eJ(interval) = ((p(interval)+ p(interval+1)) / 2)* (t(interval+1) - t(interval));
end
eJ = eJ';

%Energy Total
eT = sum(eJ(1: (length(eJ) - 1))) / (m / 1000); %/ weight in kg
%NEED WEIGHT IN KG FOR FULL EQUATION
% 268 g for pink AEV
% 380 g for pink aev unweighted cart
% 438 g for pink aev weighted cart

%Velocity
 for interval = 2 : length(s);
    vel(interval) = (s(interval) - s(interval - 1))/(t(interval) - t(interval-1));
 end
vel = vel';
    
%Kinetic Energy
kE = 0.5 .* m .* (v .^ 2);
    
%RPM
rPM = (-64.59 .* (i .^ 2) + 1927.25 .* i - 84.58) .* 0.8; %3 inch propeller

%Advance Ratio
j = vel ./ ((rPM ./ 60) .* (0.0762));

%Propulsion efficiency
n = -454.37 .* (j .^ 3) + 321.58 .* (j .^ 2) + 22.603 .* j;

%Advance Ratio Filter
for interval = 1:length(j)
    if (i(interval) == 0) && (j(interval) <= 0.15);
        j(interval) = 0;
    
    elseif (i(interval) > 0) && (j(interval) < 0.15);
        j(interval) = 0.15;
    end
end


figure
scatter(j,n,'*')
xlabel('Advance Ratio, dimensionless')
ylabel('Propulsion efficiency, %')
xlim([0,1])
ylim([0,100])
grid

figure
plot(t,p)
xlabel('Time, s')
ylabel('Power, W')
grid
    
%Performance analysis plots
figure
plot(d,p)
xlabel('Distance, m')
ylabel('Power, W')
grid

figure
plot(d,vel)
xlabel('Distance, m')
ylabel('Velocity, m/s')
grid
    
figure
plot(d,kE)
xlabel('Distance, m')
ylabel('Kinetic Energy, J')
grid

figure
plot(d,n)
xlabel('Distance, m')
ylabel('Propulsion Efficiency, %')
grid

%Combined graph
figure
subplot(4,1,1)
plot(d,p)
xlabel('Distance, m')
ylabel('Power, W')
grid

subplot(4,1,2)
plot(d, vel)
xlabel('Distance, m')
ylabel('Velocity, m/s')
grid

subplot(4,1,3)
plot(d, kE)
xlabel('Distance, m')
ylabel('Kinetic Energy, J')
grid

subplot(4,1,4)
plot(d, n)
xlabel('Distance, m')
ylabel('Propulsion Efficiency, %')
grid

