Function mrofer, dta
  size_dta = size(dta, /dimensions)
  onedf = dblarr(size_dta[1]*size_dta[0],2)
  for i0=0, size_dta[1]-1 do begin
    onedf[i0*size_dta[0]:(i0+1)*size_dta[0]-1,0] = dta[*,i0,0]
    onedf[i0*size_dta[0]:(i0+1)*size_dta[0]-1,1] = dta[*,i0,4]
  endfor
  return, onedf
  end