Function w_autodisplay,listname,index
	fits_read, listname[index], tmp_cur
	window, 0, xsize=1000, ysize=1000,title = 'tmp_window'
;	con_tmp_cur = congrid(tmp_cur, ssxx, ssyy, cubic = -0.5)
	con_tmp_cur = congrid(tmp_cur, 1000, 1000, cubic = -0.5)
	tvscl, con_tmp_cur,/norm
	print, w_maptime(listname[index])
end

