Function bin_add, dta, pbin_s,pbin_m,pbin_x,pbin_y
  size_dta = size(dta, /dimensions)
  result = fltarr(size_dta[0], size_dta[1]+4)
  result[*,0:size_dta[1]-1] = dta
  for i0=0, size_dta[0]-1 do begin
    tmp_class = float(floor(dta[i0,0]/pbin_s)+1)
    result[i0,size_dta[1]] = tmp_class
    tmp_mag = float(floor(abs(dta[i0,1]/pbin_m))+1)
    result[i0,size_dta[1]+1] = tmp_mag
    tmp_x = float(floor(abs(dta[i0,2]/pbin_x))+1)
    result[i0,size_dta[1]+2] = tmp_x
    tmp_y = float(floor(abs(dta[i0,3]/pbin_y))+1)
    result[i0,size_dta[1]+3] = tmp_y
  endfor
return, result
end
