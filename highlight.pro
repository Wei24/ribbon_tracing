Function highlight, dta
  partial_dta = dta[358:456,555:690,60:82,0]
  size_dta = size(partial_dta, /dimensions)
  highpoint = intarr(size_dta[1],size_dta[2]) 
  smooth_colume = intarr(size_dta[1],size_dta[2])
  result = fltarr(size_dta[0],size_dta[1],size_dta[2])
  for i0=0, size_dta[2]-1 do begin
     for i1=0, size_dta[1]-1 do begin
  
      ;if (i0 eq 0) and (i1 le 90) then begin
       ; highpoint[i1,i0] = w_maxloc(partial_dta[*,i1,i0],42)
     ; endif else begin
     ;   if (i0 eq 0) and (i1 gt 90) then begin
     ;     highpoint[i1,i0] = w_maxloc(partial_dta[*,i1,i0],97)
     ;   endif else begin
     ;  highpoint[i1,i0] = w_maxloc(partial_dta[*,i1,i0],highpoint[i1,i0-1])
      highpoint[i1,i0] = w_maxloc(partial_dta[*,i1,i0],98)
     ;   endelse
      ;  endelse
print, 'curr_va = ', highpoint[i1,i0]
      ; result[highpoint[i1,i0],i1,i0] = 32760.0
     endfor
     smooth_colume[*,i0] = smooth(highpoint[*,i0],10)
  endfor
  for i2=0, size_dta[2]-1 do begin
    for i3=0, size_dta[1]-1 do begin
      result[smooth_colume[i3,i2],i3,i2] = 32760.0
    endfor
  endfor
  return, result
  ;return, smooth_colume
end
