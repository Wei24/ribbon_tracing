Function work_flow_20170918, dta
  size_dta = size(dta, /dimensions)
  index_array = intarr(size_dta[1],size_dta[2])
  ;speed_array = fltarr(size_dta[1],size_dta[2]-1,5)
  speed_array = fltarr(size_dta[1],size_dta[2]-2,5)
  for i0 = 0, size_dta[2]-1 do begin
    for i1 = 0, size_dta[1]-1 do begin
      for i2 = 0, size_dta[0]-1 do begin
          if (dta[i2,i1,i0,0] ne 0) then begin
            index_array[i1,i0] = i2
          endif
      endfor
    endfor
  endfor
  for i3 = 0, size_dta[2] - 3 do begin
  ;for i3 = 0, size_dta[2] - 2 do begin
 ;print,'cur_time:' ,dta_time[i3+1] - dta_time[i3]
    for i4 = 0, size_dta[1]-1 do begin
      ;speed_array[i4,i3,0] = (index_array[i4,i3] - index_array[i4,i3+1])
      speed_array[i4,i3,0] = (index_array[i4,i3] - index_array[i4,i3+2])
;print,'   and cur_distance:  ', index_array[i4,i3] - index_array[i4,i3+1]
      speed_array[i4,i3,1] = double(dta[index_array[i4,i3],i4,i3,1])
      speed_array[i4,i3,2] = double(dta[index_array[i4,i3],i4,i3,2])
      speed_array[i4,i3,3] = double(dta[index_array[i4,i3],i4,i3,3])
      speed_array[i4,i3,4] = double(dta[index_array[i4,i3],i4,i3,4])
    endfor
  endfor
  return, speed_array
 end