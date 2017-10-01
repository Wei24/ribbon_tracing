Function work_flow_filter_20170917, dta
  size_dta = size(dta, /dimensions)
  aaa = [0.0]
  bbb = [0.0]
  for i0 = 0, size_dta[0]-1 do begin
    if (dta[i0,0] gt 0) and (dta[i0,0] le 40)then begin
      aaa = [aaa,dta[i0,0]]
      bbb = [bbb,dta[i0,1]]
    endif
  endfor
  size_aaa = size(aaa, /dimensions)
  result = fltarr(size_aaa[0],2)
  result[*,0] = aaa
  result[*,1] = bbb
  return, result
end