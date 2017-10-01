Function workflow_20170917, dta_partial, dta
  size_dta = size(dta, /dimensions)
  result_dta = fltarr(99,136,23,5)
  for i0=1, size_dta[3]-1 do begin
  result_dta[*,*,*,i0] = dta[358:456,555:690,60:82,i0]
  endfor
  result_dta[*,*,*,0] = dta_partial
  return, result_dta
end