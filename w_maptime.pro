Function w_maptime, filename
	
	fits2map, filename, mmaapp
	Strtime = strsplit(mmaapp.time, '- :', /extract)
	time = Long(Strtime[3])*3600 + Long(Strtime[4])*60 + Double(Strtime[5])
;print,'cur_str is', time
	return, Double(time)
End
