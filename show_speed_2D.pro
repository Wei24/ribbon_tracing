Function show_speed, dta, x_size, y_size
  size_dta = size(dta, /dimensions)
  result = fltarr(x_size, y_size)
  for i0=0, y_size-1 do begin
    for i1=0, size_dta[2]-1 do begin
      result[dta[i0,i1,5], i0] = dta[i0,i1,0]
    endfor
  endfor
return, result
end
