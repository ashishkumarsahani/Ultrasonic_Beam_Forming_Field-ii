Function [sample_val_Arr_for_Elements]= convert_to_sample_values(distance_of _all_pixels_Arr, speed_of_sound, sampling_Start_time, Sample_Num_Arr);
	Tim_Arr=( distance_of _all_pixels_Arr*10^-3)/speed_of_Sound – Sampling_Start_Time;
	Sample_Num_Arr = round(sampling_rate*time_Arr)+1;
	S = size(sample_Num_Arr);
	Sampling_Val_Arr_for_Element = zero(size(S));
	for i = 1:S(1)
		for j = 1:S(2);
			if(Sample_Num_Arr(i,j)>0)
				sample_Val_Arr_for_Element(i,j) = v(Sample_Num_Arr(i,j), element_Num);
			end
		end
    end
