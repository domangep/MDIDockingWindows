$PBExportHeader$w_demo_startpage.srw
forward
global type w_demo_startpage from w_demo_base_ui
end type
type p_4 from picture within w_demo_startpage
end type
type p_6_2 from picture within w_demo_startpage
end type
type p_6_1 from picture within w_demo_startpage
end type
type p_3_b1x from picture within w_demo_startpage
end type
type p_1_4 from picture within w_demo_startpage
end type
type p_1_3 from picture within w_demo_startpage
end type
type p_1_2 from picture within w_demo_startpage
end type
type p_6 from picture within w_demo_startpage
end type
type p_3_r2 from picture within w_demo_startpage
end type
type p_3_r1 from picture within w_demo_startpage
end type
type p_3 from picture within w_demo_startpage
end type
type p_3_b1 from picture within w_demo_startpage
end type
type p_1 from picture within w_demo_startpage
end type
type p_2 from picture within w_demo_startpage
end type
end forward

global type w_demo_startpage from w_demo_base_ui
integer width = 5605
integer height = 3728
long backcolor = 134217746
p_4 p_4
p_6_2 p_6_2
p_6_1 p_6_1
p_3_b1x p_3_b1x
p_1_4 p_1_4
p_1_3 p_1_3
p_1_2 p_1_2
p_6 p_6
p_3_r2 p_3_r2
p_3_r1 p_3_r1
p_3 p_3
p_3_b1 p_3_b1
p_1 p_1
p_2 p_2
end type
global w_demo_startpage w_demo_startpage

event open;call super::open;//
this.triggerevent("resize")

this.is_sheet_type = "DOC"

this.p_1.picturename = "pics\startpage_1.jpg"
this.p_2.picturename = "pics\startpage_2.jpg"
this.p_3.picturename = "pics\startpage_3.jpg"

this.p_1_2.picturename = "pics\StartPage_1_2.jpg"
p_1_3.picturename = "pics\StartPage_1_3.jpg"
p_1_4.picturename = "pics\StartPage_1_4.jpg"
p_3_r1.picturename = "pics\StartPage_3_r1.jpg"
p_3_r2.picturename = "pics\StartPage_3_r2.jpg"
p_3_b1.picturename = "pics\StartPage_3_b1.jpg"
p_3_b1x.picturename = "pics\StartPage_3_b1x.jpg"

p_6.picturename = "pics\StartPage_6.jpg"
p_6_2.picturename = "pics\StartPage_6_2.jpg"
p_6_1.picturename = "pics\StartPage_6_1.jpg"
end event

on w_demo_startpage.create
int iCurrent
call super::create
this.p_4=create p_4
this.p_6_2=create p_6_2
this.p_6_1=create p_6_1
this.p_3_b1x=create p_3_b1x
this.p_1_4=create p_1_4
this.p_1_3=create p_1_3
this.p_1_2=create p_1_2
this.p_6=create p_6
this.p_3_r2=create p_3_r2
this.p_3_r1=create p_3_r1
this.p_3=create p_3
this.p_3_b1=create p_3_b1
this.p_1=create p_1
this.p_2=create p_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_4
this.Control[iCurrent+2]=this.p_6_2
this.Control[iCurrent+3]=this.p_6_1
this.Control[iCurrent+4]=this.p_3_b1x
this.Control[iCurrent+5]=this.p_1_4
this.Control[iCurrent+6]=this.p_1_3
this.Control[iCurrent+7]=this.p_1_2
this.Control[iCurrent+8]=this.p_6
this.Control[iCurrent+9]=this.p_3_r2
this.Control[iCurrent+10]=this.p_3_r1
this.Control[iCurrent+11]=this.p_3
this.Control[iCurrent+12]=this.p_3_b1
this.Control[iCurrent+13]=this.p_1
this.Control[iCurrent+14]=this.p_2
end on

on w_demo_startpage.destroy
call super::destroy
destroy(this.p_4)
destroy(this.p_6_2)
destroy(this.p_6_1)
destroy(this.p_3_b1x)
destroy(this.p_1_4)
destroy(this.p_1_3)
destroy(this.p_1_2)
destroy(this.p_6)
destroy(this.p_3_r2)
destroy(this.p_3_r1)
destroy(this.p_3)
destroy(this.p_3_b1)
destroy(this.p_1)
destroy(this.p_2)
end on

event resize;this.setredraw(false)
//this.p_2.x = this.width - this.p_2.width
this.p_2.width = this.width - this.p_1.width + 1000
long ll_tmp

ll_tmp = p_3.x - p_3_b1.x
if this.height > p_1_2.y + 600 then

	//
	p_1_3.height = this.height - p_1.height - p_1_2.height - p_1_4.height 
	p_1_4.y = this.height - p_1_4.height - 30
	
	//
	this.p_3_r2.x = this.width - p_3_r2.width 
	//this.p_3_r1.width = this.width - p_1.width - p_3_r1.width - p_3_r2.width
	this.p_3_r1.width = this.width - p_1.width  - p_3_r2.width
	
	p_3_b1.height = this.height -  p_3.height - p_2.height -  p_6.height
	p_3_b1x.x = this.width - p_3_b1x.width
	p_4.x = p_3_b1.width + p_3_b1.x
	p_4.y = p_3_b1.y
	p_4.width = this.width - p_4.x - p_3_b1x.width
	p_4.height = p_3_b1.height
	//p_3_b1x.width = this.width - p_3_b1x.x

	p_3_b1x.height = p_3_b1.height + 10
	p_6.y = p_1_4.y //this.height -  p_6.height - 100
	p_6_2.x = this.width - p_6_2.width
	p_6_2.y =  p_6.y - 10
	p_6_1.y = p_6.y - 5
	p_6_1.width = p_3_r1.width

end if
this.setredraw(true)
end event

type p_4 from picture within w_demo_startpage
integer x = 4448
integer y = 2268
integer width = 174
integer height = 108
string picturename = "C:\Users\Public\Documents\Appeon\PowerBuilder 17.0\Code Examples\MDIDockingDemo\Pics\StartPage_4_1.JPG"
boolean focusrectangle = false
end type

type p_6_2 from picture within w_demo_startpage
integer x = 4571
integer y = 2352
integer width = 119
integer height = 280
string picturename = ".\Pics\StartPage_6_2.jpg"
boolean focusrectangle = false
end type

type p_6_1 from picture within w_demo_startpage
integer x = 4530
integer y = 2356
integer width = 78
integer height = 272
string picturename = ".\Pics\StartPage_6_1.jpg"
boolean focusrectangle = false
end type

type p_3_b1x from picture within w_demo_startpage
integer x = 4590
integer y = 2284
integer width = 101
integer height = 88
string picturename = ".\Pics\StartPage_3_b1x.jpg"
boolean focusrectangle = false
end type

type p_1_4 from picture within w_demo_startpage
integer y = 2348
integer width = 1678
integer height = 268
boolean originalsize = true
string picturename = ".\Pics\StartPage_1_4.jpg"
boolean focusrectangle = false
end type

type p_1_3 from picture within w_demo_startpage
integer y = 2304
integer width = 1678
integer height = 44
string picturename = ".\Pics\StartPage_1_3.jpg"
boolean focusrectangle = false
end type

type p_1_2 from picture within w_demo_startpage
integer y = 1700
integer width = 1687
integer height = 624
string picturename = ".\Pics\StartPage_1_2.jpg"
boolean focusrectangle = false
end type

type p_6 from picture within w_demo_startpage
integer x = 1659
integer y = 2360
integer width = 2885
integer height = 260
boolean originalsize = true
string picturename = ".\Pics\StartPage_6.jpg"
boolean focusrectangle = false
end type

type p_3_r2 from picture within w_demo_startpage
integer x = 4594
integer y = 624
integer width = 96
integer height = 1684
string picturename = ".\Pics\StartPage_3_r2.jpg"
boolean focusrectangle = false
end type

type p_3_r1 from picture within w_demo_startpage
integer x = 4421
integer y = 648
integer width = 174
integer height = 1668
string picturename = ".\Pics\StartPage_3_r1.jpg"
boolean focusrectangle = false
end type

type p_3 from picture within w_demo_startpage
integer x = 1678
integer y = 612
integer width = 2743
integer height = 1716
boolean originalsize = true
string picturename = ".\Pics\StartPage_3.jpg"
boolean focusrectangle = false
end type

type p_3_b1 from picture within w_demo_startpage
integer x = 1646
integer y = 2316
integer width = 2930
integer height = 44
string picturename = ".\Pics\StartPage_3_b1.jpg"
boolean focusrectangle = false
end type

type p_1 from picture within w_demo_startpage
integer width = 1687
integer height = 1704
boolean bringtotop = true
boolean originalsize = true
string picturename = ".\Pics\StartPage_1.jpg"
boolean focusrectangle = false
end type

type p_2 from picture within w_demo_startpage
integer x = 1655
integer width = 3058
integer height = 616
string picturename = ".\Pics\StartPage_2.jpg"
boolean focusrectangle = false
end type

