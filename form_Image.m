function [beamformed_Image] = form_Image(RF_Arr, element_Pos_Array_um_X, speed_Of_Sound_umps, RF_Start_Time, sampling_Freq, image_Range_X_um, image_Range_Z_um)
beamformed_Image = zeros(length(image_Range_X_um), length(image_Range_Z_um));
S = size(RF_Arr);
N = S(1);
    for Xi = 1:length(image_Range_X_um)
        for Zi = 1:length(image_Range_Z_um)
            %%%Calculate sum of intensity at each element for this pixel
            S = size(element_Pos_Array_um_X);
            pixel_Amp = 0;
                for ex = 1:length(element_Pos_Array_um_X)
                    %distance of pixel from element in um. 
                    %Planar transmit and angular return=  (Z+ return distance)
                    distance_Along_RF = image_Range_Z_um(Zi)+ sqrt((image_Range_X_um(Xi)- element_Pos_Array_um_X(ex))^2 +(image_Range_Z_um(Zi))^2); 
                    time_Pt_Along_RF = distance_Along_RF/(speed_Of_Sound_umps);
                    sample_Pt = round((time_Pt_Along_RF - RF_Start_Time)*sampling_Freq) +1; 
                    if(sample_Pt>N || sample_Pt<1)
                    RF_Amp = 0;
                    else
                        RF_Amp = RF_Arr(sample_Pt, ex);
                    end
                    pixel_Amp = pixel_Amp + RF_Amp;
                end
            beamformed_Image(Xi, Zi) = pixel_Amp;
        end
    end
%beamformed_Image = log(abs(hilbert(beamformed_Image))+100000);
end
