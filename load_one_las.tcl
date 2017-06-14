# Boot strap \
exec tclsh "$0" "$@"

global env


# Write out debug info to log file for debugging 
proc debugme {str} {
    puts "grtdh.tclsh ==> $str"
}

set projectName $env(PG_PROJECT)
set wellName $env(PG_WELL)
set setName $env(SETNAME)
set inputFile $env(USEFILE) 


#-----------------------------------------------------------------------------------------------
# 
#-----------------------------------------------------------------------------------------------
catch { well_open well=$wellName  } 
debugme "Opened   $wellName"
tp_from_las file_in=${inputFile} | log_dbms mode=store project=$projectName 
catch { well_save  } 
catch { well_close } 
catch { well_exit } 
exit 0
