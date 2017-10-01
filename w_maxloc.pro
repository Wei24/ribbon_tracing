Function w_maxloc, dta, limit
  size_dta = size(dta, /dimensions)
  tmp = -999
  loc = 0
  cur_sec = 0L
  ;for i0=0, limit-6 do begin
  for i0=0, limit-1 do begin
   ;for i0=limit-20, limit-1 do begin
;print,dta[i0]  ,'aaaa', dta[i0+1]  ,'aaaa', dta[i0+2]  ,'aaaa',dta[i0+3] ,'aaaa', dta[i0+4]
    ;cur_sec = (abs(dta[i0]) + abs(dta[i0+1]) + abs(dta[i0+2]) +abs(dta[i0+3]) + abs(dta[i0+4]))/10
    cur_sec = abs(dta[i0])
;print, 'cur_sec  = ', cur_sec, '     ,when i0 is : ' ,i0
    if (cur_sec gt tmp) then begin
      loc = i0
      tmp = cur_sec
    endif
  endfor
  return, loc
end 