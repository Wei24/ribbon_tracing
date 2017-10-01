dir = '/media/data/yw633/15jun22_pcosr'
fl = file_search(dir+'/*fts', count=n)
hom = n 
fits_read, fl[0], data
s = size(data)
dta = intarr(s[1],s[2],hom)
cor = dblarr(hom,2)

time0 = file2sec(fl[700], 9)
fits_read, fl[700], baseline
for i = 0,hom -1 do begin
  help, i
  fits_read, fl[i], data
  dta[*,*,i]=data
;  set_plot, 'ps'
;  device, filename = '/home/yuqainwei/practice/img/' + x_addzero(i,4) + '.eps', xsize = 20, ysize = 20, /Encapsulate, xoff = 0, yoff = 0
;  tvscl, data, xsize = 1, ysize = 1, /norm
;  device, /close
;  set_plot, 'X'
  cor[i,0] = Correlate(baseline,dta[*,*,i])
  timei = file2sec(fl[i], 9)
  cor[i,1] = timei - time0 
endfor
end
