
# DESCRIPTION:
# Batch LAS file loader. Written in conjunction with the Log Reprocessing
# HISTORY:
# 19-JUN-2005 RAB Initial coding

set dir [ tk_chooseDirectory -initialdir /home/geolog/ZULF_IRS/data  -title "Choose" ] 

# Get list of files to load
set files [glob $dir/*.las]
set files [join $files "\n"]

set files [mui_select type = multiple_select list = $files]

# Load files
foreach file $files {
    tp_from_las file_in = $file | tp_name_translate name_translation = /home/ecc_17/eaqkbh/spliced.names | log_dbms mode = store  set = FACIES

}
