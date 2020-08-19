close all;
no_Of_Elements = 128;
f0 = 5e6;
fs = 100e6;
c=1540;
wavelength_mm = (c/f0)*10^3;
load('L74.mat')
element_Width = Trans.elementWidth*wavelength_mm*(10^-3);
element_Height = Trans.elementWidth*wavelength_mm*(10^-3);
kerf_x = (Trans.spacing - Trans.elementWidth)*wavelength_mm*(10^-3);
focus = [0 0 5000]/1000;
enabled_Arr = ones(no_Of_Elements,1);
receive_Apreture = xdc_linear_array(no_Of_Elements, element_Width, element_Width, kerf_x, 1, 1,focus);
show_xdc(receive_Apreture)
emit_Aperture = receive_Apreture;

impulse_Response=sin(2*pi*f0*(0:1/fs:2/f0));
impulse_Response=impulse_Response.*hann(max(size(impulse_Response)))';
figure
plot(impulse_Response);
xdc_impulse (emit_Aperture, impulse_Response);
xdc_impulse (receive_Apreture, impulse_Response);

excitation= 1;
xdc_excitation (emit_Aperture, excitation);

point_position=[0, 0, 24;1, 0, 25]/1000; % Position of the point to be imaged
%point_position=[0 0 10]/1000; % Position of the point to be imaged

[rf_Data, RF_Start_Time] = calc_scat_multi(emit_Aperture, receive_Apreture, point_position,[1 1]');
figure
mesh(rf_Data);

x_um_Range = [-2:0.1:2]*1000;
z_um_Range = [23:0.1:32]*1000;
speed_Of_Sound_umps = 1540*10^6;
element_Pos_Array_um_X = Trans.ElementPos*wavelength_mm*10^3;
I = form_Image(rf_Data, element_Pos_Array_um_X, speed_Of_Sound_umps, RF_Start_Time, fs, x_um_Range, z_um_Range)
imagesc(z_um_Range, x_um_Range, envelope(I))