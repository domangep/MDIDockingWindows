$PBExportHeader$uo_splitebar.sru
forward
global type uo_splitebar from statictext
end type
end forward

global type uo_splitebar from statictext
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type
global uo_splitebar uo_splitebar

on uo_splitebar.create
end on

on uo_splitebar.destroy
end on

event constructor;this.backColor = gl_splitebackcolor
end event

