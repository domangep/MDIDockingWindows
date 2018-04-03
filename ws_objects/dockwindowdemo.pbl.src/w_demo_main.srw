$PBExportHeader$w_demo_main.srw
forward
global type w_demo_main from window
end type
type mdi_1 from mdiclient within w_demo_main
end type
end forward

global type w_demo_main from window
integer width = 3168
integer height = 1952
boolean titlebar = true
string title = "Powerbuilder.Net IDE"
string menuname = "m_demo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdidockhelp!
windowstate windowstate = maximized!
long backcolor = 67108864
boolean center = true
long titlebaractivecolor = 15793151
long titlebaractivegradientcolor = 1073741824
long titlebarinactivetextcolor = 16777215
boolean tabbeddocumenttabcolorsusetheme = false
long tabbeddocumentinactivetabtextcolor = 16777215
long tabbeddocumentmouseovertabbackcolor = 134217731
long tabbeddocumentmouseovertabgradientbackcolor = 134217731
long tabbeddocumentmouseovertabtextcolor = 16777215
boolean tabbedwindowtabcolorsusetheme = false
long tabbedwindowinactivetabtextcolor = 16777215
long tabbedwindowmouseovertabbackcolor = 134217731
long tabbedwindowmouseovertabgradientbackcolor = 134217731
long tabbedwindowmouseovertabtextcolor = 16777215
event ue_open_document ( )
mdi_1 mdi_1
end type
global w_demo_main w_demo_main

type variables
window w[]

end variables

forward prototypes
public function window wf_get_sheet_doc ()
public function integer wf_get_sheet_max (string as_wintype)
public function integer wf_open_sheet_doc (string as_win_param)
public function window wf_check_win_opened (string as_window)
public function integer wf_active_win (string as_window)
public function integer wf_open_sheet_win (string as_win_param, string as_position)
public subroutine wf_initialize_winname ()
public function window wf_get_sheet_win (string as_window)
public subroutine wf_initialize_winproperty ()
public subroutine wf_initialize_windows ()
public function integer wf_restore_sheets ()
end prototypes

event ue_open_document();

choose case upper(gs_solution_data)
	case "APP"
	case "WIN"
	case "DW"
end choose
end event

public function window wf_get_sheet_doc ();
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

w_demo_base_ui win
win = this.getfirstsheet()
do while isvalid( win )
	if win.is_sheet_type = "DOC" then
		return win
	end if
	win = this.getnextsheet( win )
loop

return this

end function

public function integer wf_get_sheet_max (string as_wintype);integer li_win_cnt
choose case upper(as_wintype)
	case "DOC"
		
	case "TYPE"
		
	case "ALL"
		li_win_cnt = upperbound( w[] )
		
end choose

if li_win_cnt <  0 or isnull(li_win_cnt) then
	li_win_cnt = 0
end if

return li_win_cnt
end function

public function integer wf_open_sheet_doc (string as_win_param);integer li_win_num, li_open_rtn
string ls_win, ls_id 
window lw_refer

if as_win_param = "Start Page" then
	ls_win = "w_demo_startpage"
else	
	ls_win = "w_demo_tabdocument"	
end if

//Check document window has been opened or not
//if opened then active , else open it

if wf_active_win(as_win_param) > 0 then
	return 1
end if

//open it
ls_id = f_getrand() + ";" + as_win_param
li_win_num = wf_get_sheet_max("ALL") + 1
lw_refer = wf_get_sheet_doc()

if isvalid( lw_refer )  then
	//li_open_rtn = OpenSheetwithParmAsDocument( w[li_win_num], as_win_param, "w_demo_tabdocument", lw_refer, ls_id  )
	li_open_rtn = OpenSheetwithParmAsDocument( w[li_win_num], as_win_param, ls_win, lw_refer, ls_id  )
else
	Messagebox( "Parameter : " + as_win_param, "System can't find corresponding window !")
	li_open_rtn = -1
end if

return li_open_rtn
end function

public function window wf_check_win_opened (string as_window);w_demo_base_ui ww

ww = this.getfirstsheet()
do while isvalid(ww)
	if ww.as_window = as_window then
		return ww
	end if
	ww=this.getnextsheet( ww )
loop

return ww

end function

public function integer wf_active_win (string as_window);
window lw_refer

lw_refer = wf_check_win_opened( as_window )
if isvalid( lw_refer ) then
	lw_refer.triggerevent( activate! )	
	lw_refer.setfocus()
	lw_refer.show()
	return 1
else
	return 0
end if

end function

public function integer wf_open_sheet_win (string as_win_param, string as_position);integer li_win_num, li_open_rtn
string ls_win, ls_wins_refer[2], ls_id
Windowdockposition lwdp

window lw_refer

ls_win = "w_demo_tabwindow"	

//Check document window has been opened or not
//if opened then active , else open it

if wf_active_win(as_win_param) > 0 then
	return 1
end if

// open it
ls_id = f_getrand() + ";" + as_win_param
choose case upper( as_position )
	case "TOP"
		lwdp = WindowDockTop!
		
	case "BOTTOM"
		ls_wins_refer[1] = "OutPut"
		ls_wins_refer[2] = "ErrorList"
		lwdp = WindowDockBottom!
	case "LEFT"
		ls_wins_refer[1] = "Solution"
		ls_wins_refer[2] = "Toolbox"
		lwdp = WindowDockLeft!
	
	case "RIGHT"
		ls_wins_refer[1] = "Properties"
		ls_wins_refer[2] = "PBObject"
		lwdp = WindowDockRight!
		
end choose

//  Get refer window whether open or not, 
//  if opened then open in tabgroup, 
//  else opened with new dock window
if as_win_param = ls_wins_refer[1] then
	lw_refer = wf_get_sheet_win( ls_wins_refer[2] )
else
	lw_refer = wf_get_sheet_win( ls_wins_refer[1] )
end if

li_win_num = wf_get_sheet_max("ALL") + 1

if isvalid( lw_refer ) and lw_refer.windowtype<> MDIDockHelp! then
	li_open_rtn = OpenSheetwithParmInTabGroup( w[li_win_num], as_win_param,ls_win, lw_refer, ls_id  )
else
	li_open_rtn = OpenSheetWithParmDocked( w[li_win_num], as_win_param,ls_win, lw_refer, lwdp , ls_id  )
end if

return li_open_rtn
end function

public subroutine wf_initialize_winname ();
		
end subroutine

public function window wf_get_sheet_win (string as_window);
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

w_demo_base_ui win
win = this.getfirstsheet()
do while isvalid( win )
	if win.is_sheet_type = "WIN" and win.as_window = as_window then
		return win
	end if
	win = this.getnextsheet( win )
loop

return this

end function

public subroutine wf_initialize_winproperty ();gl_tabAreaColor = RGB(41,57,85)	
gl_ActiveBarColor = RGB(255,243,205)
 gl_splitebackcolor= rgb(188, 199, 216 )
 
this.TabbedDocumentTabsAreaColor = gl_tabAreaColor
this.TabbedDocumentTabsAreaGradientColor = gl_tabAreaColor
This.TabbedWindowTabsAreaColor =	gl_tabAreaColor
This.TabbedWindowTabsAreaGradientColor =	gl_tabAreaColor

this.TabbedDocumentInActiveTabBackColor = gl_tabAreaColor
this.TabbedDocumentInActiveTabGradientBackColor = gl_tabAreaColor
This.TabbedWindowInActiveTabBackColor =	gl_tabAreaColor
This.TabbedWindowInActiveTabGradientBackColor =	gl_tabAreaColor

this.TabbedDocumentActiveTabBackColor = gl_ActiveBarColor
this.TabbedDocumentActiveTabGradientBackColor = gl_ActiveBarColor
This.TabbedWindowActiveTabBackColor =	gl_ActiveBarColor
This.TabbedWindowActiveTabGradientBackColor =	gl_ActiveBarColor


This.titleBarInactiveColor = 	gl_tabAreaColor
This.titleBarInactiveGradientColor = 	gl_tabAreaColor
This.titleBarActiveColor = 	gl_ActiveBarColor
This.titleBarActiveGradientColor = 	gl_ActiveBarColor

gs_registry = "\DockingWindow\Demo" // profilestring("dockwindow.ini", "registry", "RegistryName", "dockwindowtest")
gs_solution_data = "APP"
end subroutine

public subroutine wf_initialize_windows ();//



wf_open_sheet_win("OutPut", "Bottom")
wf_open_sheet_win("ErrorList", "Bottom")

wf_open_sheet_win("Solution", "Left")
wf_open_sheet_win("Toolbox", "Left")

wf_open_sheet_win("Properties", "Right")
wf_open_sheet_win("PBObject", "Right")

wf_open_sheet_doc("Start Page")


end subroutine

public function integer wf_restore_sheets ();string s1[], s2[], ls_parm
integer li_start, li_end, li_i, li_rtn, li_pos
li_rtn = LoadDockingState(gs_registry,s1,s2)

if li_rtn < 0 then return li_rtn

w_demo_base_ui lw_window
li_start = lowerbound(s1)
li_end = upperbound(s2)

if li_start > li_end then return -1

for li_i = li_start to li_end
	li_pos = pos(s2[li_i],";")+1
	ls_parm = Mid(s2[li_i],li_pos)
	opensheetWithParmFromDockingState(lw_window,ls_parm,s1[li_i], this, s2[li_i])
next

return CommitDocking() 
 

end function

on w_demo_main.create
if this.MenuName = "m_demo" then this.MenuID = create m_demo
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_demo_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;
wf_initialize_winproperty( )

if wf_restore_sheets() < 0 then
	wf_initialize_windows( )
end if

gbl_can_active = true

end event

event close;integer li_rtn
if not gbl_default_layout then
	li_rtn = this.SaveDockingState( gs_registry )
end if
end event

type mdi_1 from mdiclient within w_demo_main
long BackColor=268435456
end type

