%%% Settings for the Simulink Inverter Simulation %%%

% Voltage levels
V_dc = 700; % V
V_grid = 230; % V RMS

f_grid = 50; % Hz
f_switch = 10e3; % Hz

% Passive components

% Grid inductances
L_f = 2e-3; % H
% parasitic resistance of the inductance
R_f = 10e-3; % Ohms


%%% PI control
Kp = 2;
Ti = 10e-3;

% Low pass filter to reject the PWM frequency from the voltage signal
% (4th order 1/(1+s/wc)^4 )
wc = 1/0.05e-3;

fprintf('Inverter settings defined in the workspace\n')