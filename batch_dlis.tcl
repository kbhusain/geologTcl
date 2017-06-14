#!/bin/csh -f
# DESCRIPTION:
# Batch DLIS file loader. Written in conjunction with the Log Reprocessing
# project for Tjan Twan. The script is being used to batch-load phase-1
# DLIS files produced by Geoframe.

# HISTORY:
# 19-JUN-2005 RAB Initial coding

#eval $MIN_RUN_AS_TCL

# Get directory where files are located
set dir [mui_dialog type = prompt message = \
	"Enter directory location for DLIS files" \
	default = /resd/logedit/PhaseB_Phase1_Final/MNIF/ttl/raw]

# Get list of files to load
set files [glob $dir/*.dlis]
set files [join $files "\n"]


set files [mui_select type = multiple_select list = $files]

# Load files
foreach file $files {
    tp_from_dlis_slb file_in = $file report_option = none | log_dbms mode = store
}
