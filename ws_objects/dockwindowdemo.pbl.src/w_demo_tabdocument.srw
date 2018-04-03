$PBExportHeader$w_demo_tabdocument.srw
forward
global type w_demo_tabdocument from w_demo_base_ui
end type
end forward

global type w_demo_tabdocument from w_demo_base_ui
end type
global w_demo_tabdocument w_demo_tabdocument

event open;call super::open;//
this.is_sheet_type = "DOC"
end event

on w_demo_tabdocument.create
call super::create
end on

on w_demo_tabdocument.destroy
call super::destroy
end on

