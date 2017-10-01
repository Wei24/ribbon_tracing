Function t_alignflow_20170924, ha_dta, mag, ha_time, raw_mag_time,magx,magy,magz
  mag_time = intarr(224)
  for i=0, 217 do begin
    mag_time[i] = floor(raw_mag_time[i]-raw_mag_time[0]+60195)
  endfor
  rcm_dta = fltarr(768,768,161,5)
    rcm_dta[*,*,*,0] = float(abs(ha_dta))
    curr_time = 35
  for i=140 ,300 do begin
    ;tmp_dta_ha = congrid(rot(rotate(dta_ha[*,*,i],4),-70.7),1143,1355,cubic=-0.5)
    ;   tmp_dta_tio = congrid(rot(rotate(dta_tio[*,*,i],4),40),1143,1355,cubic=-0.5)
    ;   rcm_dta[*,*,i-140,1] = tmp_dta_tio[248:,278:]
  print, 'when curr is :', curr_time, 'current ha time:  ', ha_time[i], '   While current mag time is :  ', mag_time[curr_time]
    ;if (abs(mag_time[curr_time]-ha_time[i]) ge abs(mag_time[curr_time+1]-ha_time[i])) and (curr_time lt 86) then begin
 print, 'difference:   ', abs(mag_time[curr_time]-ha_time[i]),'   and :',abs(mag_time[curr_time+1]-ha_time[i])
     if (abs(mag_time[curr_time]-ha_time[i]) ge abs(mag_time[curr_time+1]-ha_time[i])) then begin
print, 'bingo!!!!!'
      curr_time = curr_time + 1
    endif
    rcm_dta[*,*,i-140,1] = mag[*,*,curr_time]
    rcm_dta[*,*,i-140,2] = magx[*,*,curr_time]
    rcm_dta[*,*,i-140,3] = magy[*,*,curr_time]
    rcm_dta[*,*,i-140,4] = magz[*,*,curr_time]
  endfor
  return, rcm_dta
end

