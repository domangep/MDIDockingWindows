$PBExportHeader$dockwindowdemo.sra
$PBExportComments$Generated Application Object
forward
global type dockwindowdemo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
long gl_TabAreaColor, gl_ActiveBarColor, gl_splitebackcolor
string gs_solution_data, gs_registry
Boolean gbl_can_active = false
Boolean gbl_resize_old = false
Boolean gbl_default_layout =  false

end variables

global type dockwindowdemo from application
string appname = "dockwindowdemo"
end type
global dockwindowdemo dockwindowdemo

type variables

end variables

on dockwindowdemo.create
appname="dockwindowdemo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dockwindowdemo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_demo_main)
//open(w_demo_startpage)
end event

