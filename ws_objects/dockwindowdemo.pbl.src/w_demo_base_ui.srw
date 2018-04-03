$PBExportHeader$w_demo_base_ui.srw
forward
global type w_demo_base_ui from window
end type
end forward

global type w_demo_base_ui from window
integer width = 1536
integer height = 1876
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
event ue_solution_selectedchanged ( string as_type )
event ue_solution_doubleclicked ( )
end type
global w_demo_base_ui w_demo_base_ui

type variables
string as_window
string is_sheet_type

uo_splitebar luo_b
uo_splitebar_pic luo_bar_pic
uo_solution luo_a
uo_output luo_output

uo_error_list ldw_error
uo_pic luo_pic, luo_pic2
end variables

forward prototypes
public function integer wf_set_window (string as_title)
public function integer wf_update_pic (string as_type)
public subroutine wf_insert_errorlist ()
end prototypes

event ue_solution_selectedchanged(string as_type);
w_demo_base_ui   win 
win=w_demo_main.getfirstsheet(   ) 
do   while   isvalid(win) 
	win.wf_update_pic("")
	win=w_demo_main.getnextsheet( win  ) 
loop 



end event

event ue_solution_DoubleClicked();//

choose case upper(gs_solution_data)
	case "APP"
		w_demo_main.wf_open_sheet_doc("Application")
	case "DW"
		w_demo_main.wf_open_sheet_doc("Datawindow")
	case "WIN"
		w_demo_main.wf_open_sheet_doc("WinLayOut")
		w_demo_main.wf_open_sheet_doc("WinScript")
end choose
end event

public function integer wf_set_window (string as_title);this.title = as_title


choose case as_title
	case "Solution"
		this.icon = 'Project!'
		this.title = "Solution Explorer"
				
		openUserObject(luo_b, 0, 1)
		luo_b.height = 80
		luo_b.width = this.width
		
		openUserObject( luo_a, 2, 82 )
		luo_a.width = 1000
		luo_a.height = 2000
		
		
	case "Properties"
		this.icon = 'OleGenReg!'
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_PropApp_1.jpg")		
		openUserObject(luo_pic2, luo_pic.width , 1)		
		luo_pic2.wf_set_pic("pics\Demo_PropApp_2.jpg")
		luo_pic2.originalSize = false
		
	case "OutPut"
		this.icon = 'DataWindow5!'
		openUserObject(luo_bar_pic, 0, 1)
		luo_bar_pic.wf_setpic("pics\Demo_OutPutBar.jpg")
		
		
		
	case "Toolbox"
		this.icon = 'OleGenReg!'
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_ToolBox_1.jpg")
		openUserObject(luo_pic2, luo_pic.width , 1)
		luo_pic2.wf_set_pic("pics\Demo_ToolBox_2.jpg")
		luo_pic2.originalSize = false
	
	case "PBObject"
		this.icon = 'WebPBWizard!'
		this.title = "PB Object Outline" 
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_OutLine_App.jpg")
		
		
	case "Start Page"
//		openUserObject(luo_pic, 0, 1)
//		luo_pic.wf_set_pic("pics\Demo_Start.jpg")
//		luo_pic.originalSize = false
		
//	case "Object Browser"
//		this.icon = 'Information!'
	
	case "ErrorList"
		this.icon = 'Error!'
		openUserObject(luo_bar_pic, 0, 1)
		luo_bar_pic.wf_setpic("pics\Demo_ErrorList.jpg")

		openUserObject(ldw_error, 0, 95)
	
	case "Application"
		this.title = "wpfapp : Application"
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_AppScript.jpg")
		//luo_pic.originalSize = false

		
	case "Datawindow"
		this.title = "d_grid : DataWindow"
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_DWEdit.jpg")
         //luo_pic.originalSize = false
		
	case "WinLayOut"
		this.title = "w_window : window [Layout]"
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_WinLayOut.jpg")
        // luo_pic.originalSize = false
		
	case "WinScript"
		this.title = "w_window : window [Script]"
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_WinScript.jpg")
         //luo_pic.originalSize = false
			
	case "Database Painter"
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_DatabasePainter.jpg")
		//luo_pic.originalSize = false
		
	case "Object Browser"
		openUserObject(luo_pic, 0, 1)
		luo_pic.wf_set_pic("pics\Demo_ObjectBrowser.jpg")
		luo_pic.originalSize = false	
end choose

return 1
end function

public function integer wf_update_pic (string as_type);

choose case upper( gs_solution_data )
	case "APP"
		if as_window = "Properties" then
			luo_pic.wf_set_pic("pics\Demo_PropApp_1.jpg")			
			luo_pic2.wf_set_pic("pics\Demo_PropApp_2.jpg")			
			luo_pic2.visible = true
			
		elseif as_window = "Toolbox" then
			luo_pic.wf_set_pic("pics\Demo_ToolBox_Null1.jpg")
			luo_pic2.wf_set_pic("pics\Demo_ToolBox_Null2.jpg")
			
		elseif as_window = "PBObject" then
			luo_pic.wf_set_pic("pics\Demo_OutLine_App.jpg")						
		end if
			
	case "DW"
		if as_window = "Properties" then
			luo_pic.wf_set_pic("pics\Demo_PropDW_1.jpg")			
			luo_pic2.wf_set_pic("pics\Demo_PropDW_2.jpg")
			luo_pic2.visible = true
			
		elseif as_window = "Toolbox" then
			luo_pic.wf_set_pic("pics\Demo_ToolBox_DW1.jpg")
			luo_pic2.wf_set_pic("pics\Demo_ToolBox_DW2.jpg")
			
		elseif as_window = "PBObject" then
			luo_pic.wf_set_pic("pics\Demo_OutLine_DW.jpg")						
		end if
		
	case "WIN"
		if as_window = "Properties" then
			luo_pic.wf_set_pic("pics\Demo_PropWin_1.jpg")			
			luo_pic2.visible = false
			//luo_pic.width = 1000
			//luo_pic2.wf_set_pic("pics\Demo_PropWin_2.jpg")
			//luo_pic2.x = 1001
			//luo_pic2.width = 140
			
		elseif as_window = "Toolbox" then
			luo_pic.wf_set_pic("pics\Demo_ToolBox_1.jpg")
			luo_pic2.wf_set_pic("pics\Demo_ToolBox_2.jpg")
			
		elseif as_window = "PBObject" then
			luo_pic.wf_set_pic("pics\Demo_OutLine_WIN.jpg")						
		end if
		
end choose

if Pos("Properties, Toolbox, PBObject", as_window) > 0 then
	gbl_resize_old = true
	this.triggerevent("resize")
end if

return 1
end function

public subroutine wf_insert_errorlist ();integer li_row
if isvalid(ldw_error) then
	ldw_error.reset()
	li_row = ldw_error.insertrow(0)
	ldw_error.setitem(li_row, "description", "This is DockWindow Test" )
	ldw_error.setitem(li_row, "file", "c:\test\wpfapp.pbl" )
	ldw_error.setitem(li_row, "line", "110" )
	ldw_error.selectrow(li_row, true)
end if
end subroutine

event open;//
as_window =  Message.StringParm 
wf_set_window( as_window )

end event

on w_demo_base_ui.create
end on

on w_demo_base_ui.destroy
end on

event resize;//Resize

if gbl_resize_old then
	newwidth = this.width
end if

choose case as_window
	case "Solution"
		if isvalid( luo_b ) then
			luo_b.width  = newwidth
			luo_b.height = 80
		end if

	case "OutPut"
		if isvalid( luo_bar_pic ) then
			luo_bar_pic.width  = newwidth
			luo_bar_pic.height = 110			
		end if
	
	case "Toolbox",  "Properties"
		if isvalid( luo_pic2 ) then
			luo_pic2.width  = newwidth - 2 - luo_pic.width
			//luo_pic2.height = 			
		end if
		

	case "Start Page","Application", "Datawindow","WinLayOut", "WinScript",&
		    "PBObject", "Database Painter", "Object Brower"
		if isvalid( luo_pic ) then	
			luo_pic.width = newwidth - 2
			luo_pic.height = newheight - 2

		end if
		
	
	case "ErrorList"
		if isvalid( luo_bar_pic ) then
			luo_bar_pic.width  = newwidth
			luo_bar_pic.height = 90		
		end if
		if isvalid( ldw_error ) then
			ldw_error.width  = newwidth
			ldw_error.height = newheight - 100
		end if
	
		
end choose

gbl_resize_old = false

return 1
end event

event close;

w_demo_base_ui w_win
string ls_close_win

if as_window = "WinScript" or as_window = "WinLayOut" then
	if this.as_window = "WinScript"  then
		ls_close_win =  "WinLayOut" 
	else
		ls_close_win =  "WinScript" 	
	end if
	
	w_win = w_demo_main.wf_check_win_opened( ls_close_win )
	
	if isvalid( w_win ) and w_win.windowtype <> MDIDockHelp! then
		close( w_win )
	end if
end if
end event

event closequery;

//w_demo_base_ui w_win
//string ls_close_win
//
//if as_window = "WinScript" or as_window = "WinLayOut" then
//	if this.as_window = "WinScript"  then
//		ls_close_win =  "WinLayOut" 
//	else
//		ls_close_win =  "WinScript" 	
//	end if
//	
//	w_win = w_demo_main.wf_check_win_opened( ls_close_win )
//	
//	if isvalid( w_win ) and w_win.windowtype <> MDIDockHelp! then
//		close( w_win )
//	end if
//end if
end event

event activate;//f_logresult(true, as_window)

// after all sheets opened, can use activate event to change pictures of property window
if gbl_can_active then 
	integer li_i
	string ls_update_win[3] = {"Properties", "Toolbox", "PBObject"}
	w_demo_base_ui win

	// click tabbeddocument tab title, refer pictures will be changed
   if this.is_sheet_type = "DOC" then
		choose case as_window
			case "Application"
				gs_solution_data = "APP"
				
			case "Datawindow"
				gs_solution_data = "DW"		
				
			case "WinScript", "WinLayOut"		
				gs_solution_data =  "WIN" 
				
			case else
				return 
				
		end choose
	end if
	
	
	for li_i = 1 to upperbound(ls_update_win)
		win = w_demo_main.wf_check_win_opened( ls_update_win[li_i] )
		if isvalid(win) then
			win.wf_update_pic( "" )
		end if
	next
	
end if

end event

