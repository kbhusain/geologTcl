# Boot strap \
exec tclsh "$0" "$@"

global env


# Write out debug info to log file for debugging 
proc debugme {str} {
    puts "load_a_file.tclsh ==> $str"
}

set projectName $env(PG_PROJECT)
set wellName $env(PG_WELL)
set inputFile $env(USEFILE) 
set setName $env(SETNAME)

#-----------------------------------------------------------------------------------------------
# 
#-----------------------------------------------------------------------------------------------
catch { well_open well=$wellName  } 
debugme "Opened   $wellName"

catch { tp_from_las file_in=${inputFile} | log_dbms mode=store project=$projectName set=WIRE } result 
set exitCode 0
if { $result != "" } { 
    catch { tp_from_dlis_slb file_in = $file report_option = none | log_dbms mode = store } try_dlis 
	if { $try_dlis != "" } { 
    		catch { tp_from_dlis file_in = $file report_option = none | log_dbms mode = store } try_lis 
		if { $try_lis != "" } { 
			puts "Unable to load ...$inputFile ...  "
			set exitCode -3
		} else { 
			puts "Able to load ...$inputFile ... as LIS "
		}  
	} else { 
		puts "Able to load ...$inputFile ... as DLIS "
	}  	
} else { 
       puts "Able to load ...$inputFile ... as LAS "
}  
catch { well_save  } 
catch { well_close } 
catch { well_exit } 
exit $exitCode  
