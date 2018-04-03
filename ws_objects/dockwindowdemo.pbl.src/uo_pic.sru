$PBExportHeader$uo_pic.sru
forward
global type uo_pic from picture
end type
end forward

global type uo_pic from picture
integer width = 750
integer height = 420
boolean originalsize = true
boolean focusrectangle = false
end type
global uo_pic uo_pic

forward prototypes
public subroutine wf_set_pic (string as_pic)
end prototypes

public subroutine wf_set_pic (string as_pic);this.picturename = as_pic
end subroutine

on uo_pic.create
end on

on uo_pic.destroy
end on

