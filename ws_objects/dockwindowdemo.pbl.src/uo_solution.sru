$PBExportHeader$uo_solution.sru
forward
global type uo_solution from treeview
end type
end forward

global type uo_solution from treeview
integer width = 923
integer height = 1716
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean linesatroot = true
string picturename[] = {"PasteShared!","Application!","Application5!","DataWindow5!","Window!","Library5!"}
long picturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type
global uo_solution uo_solution

type variables
m_demo_popup om_1
end variables

event constructor;TreeViewItem	ltvi_Item
long li_root, li_item

ltvi_Item.Label = "Test(c:\test)"
ltvi_Item.Data = "WorkSapce"
ltvi_Item.PictureIndex = 1
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
ltvi_Item.Children = false
ltvi_Item.expanded = true
li_root = this.InsertItemLast (0, ltvi_Item)

ltvi_Item.Label = "wpfapp(c:\test)"
ltvi_Item.Data = "Application"
ltvi_Item.PictureIndex = 2
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
ltvi_Item.Children = True
ltvi_Item.expanded = true
li_root = this.InsertItemLast (li_root, ltvi_Item)

ltvi_Item.Label = "wpfapp.pbl(c:\test)"
ltvi_Item.Data = "pbl"
ltvi_Item.PictureIndex = 6
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
ltvi_Item.Children = True
ltvi_Item.expanded = true
li_root = this.InsertItemLast (li_root, ltvi_Item)

ltvi_Item.Label = "wpfapp"
ltvi_Item.Data = "app"
ltvi_Item.PictureIndex = 3
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
ltvi_Item.Children = false
ltvi_Item.selected = true
//ltvi_Item.expanded = true
li_item = this.InsertItemLast (li_root, ltvi_Item)

ltvi_Item.Label = "d_grid"
ltvi_Item.Data = "dw"
ltvi_Item.PictureIndex = 4
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
ltvi_Item.Children = false
//ltvi_Item.expanded = true
li_item = this.InsertItemLast (li_root, ltvi_Item)



ltvi_Item.Label = "w_window"
ltvi_Item.Data = "win"
ltvi_Item.PictureIndex = 5
ltvi_Item.SelectedPictureIndex = ltvi_Item.PictureIndex
ltvi_Item.Children = false
//ltvi_Item.expanded = true
li_item = this.InsertItemLast (li_root, ltvi_Item)
end event

on uo_solution.create
end on

on uo_solution.destroy
end on

event selectionchanged;//treeviewitem lti_aa
// this.getitem( newhandle, lti_aa)
// gs_solution_data = lti_aa.data
//
//parent.triggerevent("ue_solution_selectedchanged")
end event

event doubleclicked;parent.triggerevent("ue_solution_DoubleClicked")
end event

event rightclicked;treeviewitem lti_aa

if handle <= 0 then return

this.getitem( handle, lti_aa)

if pos(  "APP, DW, WIN", upper(lti_aa.data)) > 0 then
	gs_solution_data = lti_aa.data
	
	if not isvalid(om_1) then
		om_1 = create m_demo_popup	
		
	end if		
	om_1.w_win = parent
	om_1.popmenu( this.x + this.pointerx() , this.y+ this.pointery() + 50)
end if

end event

event clicked;treeviewitem lti_aa
 this.getitem( handle, lti_aa)
 
 if handle <= 0 then return
 
 gs_solution_data = lti_aa.data

parent.triggerevent("ue_solution_selectedchanged")
end event

