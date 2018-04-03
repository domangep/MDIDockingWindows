$PBExportHeader$w_demo_tabwindow.srw
forward
global type w_demo_tabwindow from w_demo_base_ui
end type
end forward

global type w_demo_tabwindow from w_demo_base_ui
integer width = 1239
integer height = 604
windowdockoptions windowdockoptions = windowdockoptiondockedandfloatonly!
end type
global w_demo_tabwindow w_demo_tabwindow

event open;call super::open;//
this.is_sheet_type = "WIN"

end event

on w_demo_tabwindow.create
call super::create
end on

on w_demo_tabwindow.destroy
call super::destroy
end on

