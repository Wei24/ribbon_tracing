Function mrofer, dta
  size_dta = size(dta, /dimensions)
  onedf = dblarr(size_dta[1]*size_dta[0],4)
  for i0=0, size_dta[1]-1 do begin

    
    onedf[i0*size_dta[0]:(i0+1)*size_dta[0]-1,0] = dta[*,i0,0]
    onedf[i0*size_dta[0]:(i0+1)*size_dta[0]-1,1] = dta[*,i0,4]
    onedf[i0*size_dta[0]:(i0+1)*size_dta[0]-1,3] = dta[*,i0,5]
    onedf[i0*size_dta[0]:(i0+1)*size_dta[0]-1,2] = i0
  endfor
  return, onedf
end
