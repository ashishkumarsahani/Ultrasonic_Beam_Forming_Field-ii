function [location_Array_X_mm, location_Array_Z_mm] = make_Pixel_location_Array(X1_mm, X2_mm, Z1_mm, Z2_mm, inter_Pixel_Distance)
X_Arr = [X1_mm:-inter_Pixel_Distance:X2_mm];
Z_Arr = [Z1_mm: inter_Pixel_Distance: Z2_mm];
location_Array_X_mm = zeros(length(X_Arr),length(Z_Arr));
location_Array_Z_mm = zeros(length(X_Arr),length(Z_Arr));
for i = 1: length(X_Arr)
    for j = 1 :length(Z_Arr)
        location_Array_X_mm(i,j) = X_Arr(i);
        location_Array_Z_mm(i,j) = Z_Arr(j);
    end
end
end

