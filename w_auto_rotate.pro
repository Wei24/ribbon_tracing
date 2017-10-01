Function w_autorotate, target_dir,target_extension, target_keyword, total_num, ref_num, movie_scale, result_index, save_switch

	;file listing
	filelist = file_search(target_dir + '/*' + target_keyword + '*' + target_extension, count=n)
	print, n
        if (total_num ge n) then begin
        total_num = n
        endif

	;result_array
	refer_time = w_maptime(filelist[ref_num])
	fits_read, filelist[ref_num], refer_array
	cur_xframe = (2^0.5)*(size(refer_array))[1]
	cur_yframe = (2^0.5)*(size(refer_array))[2]
	dta = intarr(cur_xframe,cur_yframe,total_num)
	dtime = dblarr(total_num)
	;for moive
	Movie_size_x = floor(cur_xframe*movie_scale)
	Movie_size_y = floor(cur_yframe*movie_scale)
	con_dta = intarr(Movie_size_x,Movie_size_y,total_num)

	;rotate and scale
	Dtime = intarr(n)
	for i = 0, total_num-1 do begin
	print, i
	fits_read, filelist[i], cur_data
	Dtime[i] = w_maptime(filelist[i])
	cur_angle =  (refer_time - Dtime[i])/240.
	dta[*,*,i] = rot(congrid(cur_data, cur_xframe, cur_yframe, cubic=-0.5), cur_angle, 2^(-0.5))
	con_dta[*,*,i] = congrid(dta[*,*,i], Movie_size_x,Movie_size_y, cubic = -0.5)
	endfor

	;save file
	if (save_switch eq 1) then begin
	savefile = '/home/yuqainwei/workshop/work_17summer_Ha_mag/sav/' + target_keyword + '.sav' 
	save, filename = savefile, dta, con_dta, Dtime
	endif

	if (result_index eq 0) then begin
	return, dta
	endif else begin
	return, con_dta
	endelse
end
