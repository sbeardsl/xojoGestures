#tag MobileScreen
Begin MobileScreen MainView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   False
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   ""
   Title           =   ""
   Top             =   0
   Begin iOSGestures.edgePanLeftGesture edgePanLeftGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      MaxNumberOfTouches=   1
      MinNumberOfTouches=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin MobileCanvas UnderRightEdgeCanvas
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   UnderRightEdgeCanvas, 1, <Parent>, 2, False, +1.00, 1, 1, 0, UnderRightEdgeCanvasLeft, True
      AutoLayout      =   UnderRightEdgeCanvas, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   UnderRightEdgeCanvas, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   UnderRightEdgeCanvas, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   548
      Left            =   320
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   ""
      Top             =   20
      Visible         =   True
      Width           =   0
   End
   Begin iOSGestures.edgePanRightGesture edgePanRightGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      MaxNumberOfTouches=   1
      MinNumberOfTouches=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin iOSTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AutoLayout      =   Table1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Table1, 4, BottomLabel, 3, False, +1.00, 2, 1, -*kStdControlGapV, , True
      AutoLayout      =   Table1, 2, UnderRightEdgeCanvas, 1, False, +1.00, 1, 1, 0, TableRightEdge, True
      AutoLayout      =   Table1, 1, UnderLeftEdgeCanvas, 2, False, +1.00, 1, 1, 0, , True
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   510.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   20
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSCanvas UnderLeftEdgeCanvas
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   UnderLeftEdgeCanvas, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   UnderLeftEdgeCanvas, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   UnderLeftEdgeCanvas, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   UnderLeftEdgeCanvas, 7, , 0, False, +1.00, 2, 1, 0, LeftEdgeCanvasWidth, True
      Height          =   548.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   20
      Visible         =   True
      Width           =   0.0
   End
   Begin iOSLabel BottomLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   BottomLabel, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   BottomLabel, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   BottomLabel, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   BottomLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      Enabled         =   True
      Height          =   30.0
      Left            =   0
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "<  Drag from left and right edges >"
      TextAlignment   =   1
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   538
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Activated()
		  App.ClearEvents()
		  
		  SetLeftEdgeCanvasWidth( 0 )
		  
		  edgePanLeftGesture1.Attach( Me )
		  edgePanRightGesture1.Attach( Me )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SetLeftEdgeCanvasWidth(width as integer)
		  Dim c As iOSLayoutConstraint = Self.Constraint("LeftEdgeCanvasWidth")
		  
		  if (width < 4) then
		    width = 0
		  end if
		  
		  if (c.Offset <> width) then
		    c.Offset = width
		    UnderLeftEdgeCanvas.Invalidate()
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRightEdgeCanvasLeft(newLeft as Double)
		  Dim newOffset as double = newLeft - self.size.Width
		  if (newOffset > -4) then
		    newOffset = 0
		  end if
		  
		  Dim c As iOSLayoutConstraint = Self.Constraint("UnderRightEdgeCanvasLeft")
		  Dim currentLeftOffset as double = c.Offset
		  if (newOffset <> currentLeftOffset) then
		    c.Offset = newOffset
		    UnderRightEdgeCanvas.Refresh()
		  end if
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events edgePanLeftGesture1
	#tag Event
		Sub PanEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.ClearEvents()
		  
		  
		  SetLeftEdgeCanvasWidth( 0 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  SetLeftEdgeCanvasWidth( pos.X )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UnderRightEdgeCanvas
	#tag Event
		Sub Paint(g As Graphics)
		  g.DrawingColor = Color.Red
		  g.FillRectangle( 0, 0, g.Width, g.Height )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edgePanRightGesture1
	#tag Event
		Sub PanEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.ClearEvents()
		  
		  
		  SetRightEdgeCanvasLeft( self.size.width )
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  SetRightEdgeCanvasLeft(  pos.x )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Table1
	#tag Event
		Sub Open()
		  me.AddSection("")
		  me.AddRow(0, "Tap >")
		  me.AddRow(0, "Long Press >")
		  me.AddRow(0, "Swipe >")
		  me.AddRow(0, "Pinch, Pan, and Rotate >")
		  me.AddRow(0, "Multi-Tap Button >")
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  #pragma unused section
		  
		  Dim newView As MobileScreen
		  
		  select case row
		    
		  case 0
		    newView = New TapView
		  case 1
		    newView = New LongPressView
		  case 2
		    newView = New SwipeView
		  case 3
		    newView = New PinchPanRotateView
		  case 4
		    newView = New MultiTapButtonView
		  end select
		  
		  if (newView <> nil) then
		    Self.PushTo(newView)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UnderLeftEdgeCanvas
	#tag Event
		Sub Paint(g As iOSGraphics)
		  g.FillColor = Color.Green
		  g.FillRect( 0, 0, g.Width, g.Height )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
