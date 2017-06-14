# Boot strap \
exec tclsh "$0" "$@"

set $env(PG_SITE) /home/geolog/prod/site
set xx [ log_dbms mode=list project=_all  ] 

foreach pname $xx { 
	set path ""
	if {[catch {set path [log_dbms mode=query project=$pname select=_project._path | tp_to_flat_ascii]} result]} {
    	puts "Result of log_dbms mode=query: $result"
	}
	if {[catch {set path [lindex $path 2]} result]} {
    		puts "Result of set path: $result"
	}
	set owner "Unknown" 	
	catch { set owner [ file attributes $path -owner ]  } 

	set wells "${path}/wells"
	catch { file stat $wells ggtime   } result 
	#puts "Result ---> $result " 
	if { [ string length $result ] > 0 } { 
		puts "$pname , $path , $owner,  MISSING"
		continue 
	} 		
	set atime $ggtime(mtime) 
	set mytime [ clock format $atime -format "%Y/%m/%d , %02H:%02M:%02S" ]   
	puts "$pname , $path , $owner,  $mytime"
}
