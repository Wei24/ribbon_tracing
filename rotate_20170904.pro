Function rotate_20170904, dta, degree
  dta_size = size(dta, /dimensions)
  result = dta
  for i1=0, dta_size[3]-1 do begin
    for i2=0, dta_size[2]-1 do begin
      result[*,*,i2,i1] = rot(dta[*,*,i2,i1], degree, 2^(-0.5))
    endfor
  endfor
  return, result
end