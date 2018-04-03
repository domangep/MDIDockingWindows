$PBExportHeader$uo_splitebar_pic.sru
forward
global type uo_splitebar_pic from userobject
end type
type p_1 from picture within uo_splitebar_pic
end type
end forward

global type uo_splitebar_pic from userobject
integer width = 2843
integer height = 152
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_1 p_1
end type
global uo_splitebar_pic uo_splitebar_pic

forward prototypes
public subroutine wf_setpic (string as_pic)
end prototypes

public subroutine wf_setpic (string as_pic);this.p_1.picturename = as_pic
end subroutine

event constructor;this.backcolor = gl_splitebackcolor 

end event

on uo_splitebar_pic.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on uo_splitebar_pic.destroy
destroy(this.p_1)
end on

type p_1 from picture within uo_splitebar_pic
integer width = 5714
integer height = 104
boolean originalsize = true
boolean focusrectangle = false
end type

