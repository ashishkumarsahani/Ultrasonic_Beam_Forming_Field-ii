function[distance_of_All_Pixels] = find_Distance_of_All_Pixals_from_Element(pixel_X_Arr, pixel_Z_Arr, total_Element, element_Num, element_Spacing);
S = sixe(picel_X_Arr);
distance_of_All_Pixels = zeros(S);
element_pos_X = floor(total_Elements/2 -element_Num)*element_Spacing;
	for i = 1 :S(1)
    		for j = 1:S(2)
        	current_Pixel_X = pixel_X_Arr(i,j);
        	current_Pixel_Z = pixel_Z_Arr(i,j);
        	distance_of_All_Pixel(i,j) = current_pixel_Z + sqrt((element_Pos_X - current_Pixel_X)^2 + current_Pixel_Z^2;
            end
    end

