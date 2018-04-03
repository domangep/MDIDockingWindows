$PBExportHeader$uo_output.sru
forward
global type uo_output from userobject
end type
type p_1 from picture within uo_output
end type
end forward

global type uo_output from userobject
integer width = 2843
integer height = 152
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_1 p_1
end type
global uo_output uo_output

event constructor;this.backcolor = gl_splitebackcolor 

end event

on uo_output.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on uo_output.destroy
destroy(this.p_1)
end on

type p_1 from picture within uo_output
integer width = 5714
integer height = 104
boolean originalsize = true
boolean focusrectangle = false
end type

