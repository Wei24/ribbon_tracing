function bin_filter_20170926, dta
  size_dta = size(dta, /dimensions)
  mag_sum = fltarr(2,10)
  mag_result_up = fltarr(10,3)
  mag_result_up[*,1] = findgen(10)+1
  for i0=0, size_dta[0]-1 do begin
    if ( dta[i0,0] lt 40) then begin
      class = floor(dta[i0,0]/4)
      print, class
      mag_sum[0,class] = mag_sum[0,class]+dta[i0,1]
      mag_sum[1,class] = mag_sum[1,class]+1.0
    endif
  endfor
  for i1 = 0, 9 do begin
     mag_result_up[i1,0] = mag_sum[0,i1]/mag_sum[1,i1]
     mag_result_up[i1,2] = (1/mag_sum[1,i1])*mag_sum[0,i1]
  endfor
  return, mag_result_up
end
      