#tag IOSView
Begin iosView MainView
   BackButtonTitle =   "Home"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Table1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Table1, 2, UnderRightEdgeCanvas, 1, False, +1.00, 1, 1, 0, TableRightEdge
      AutoLayout      =   Table1, 1, UnderLeftEdgeCanvas, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Table1, 4, BottomLabel, 3, False, +1.00, 2, 1, -*kStdControlGapV, 
      Format          =   "0"
      Height          =   422.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   20
      Visible         =   True
      Width           =   320.0
      Begin iOSCanvas UnderLeftEdgeCanvas
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   UnderLeftEdgeCanvas, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, 
         AutoLayout      =   UnderLeftEdgeCanvas, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
         AutoLayout      =   UnderLeftEdgeCanvas, 7, , 0, False, +1.00, 2, 1, 0, LeftEdgeCanvasWidth
         AutoLayout      =   UnderLeftEdgeCanvas, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
         Height          =   460.0
         Left            =   0
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Table1"
         Scope           =   0
         Top             =   20
         Visible         =   True
         Width           =   0.0
      End
      Begin iOSLabel BottomLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   BottomLabel, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, 
         AutoLayout      =   BottomLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   BottomLabel, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   BottomLabel, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
         Enabled         =   True
         Height          =   30.0
         Left            =   0
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Table1"
         Scope           =   0
         Text            =   "<  Drag from left and right edges >"
         TextAlignment   =   "1"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   450
         Visible         =   True
         Width           =   320.0
      End
   End
   Begin iOSGestures.edgePanLeftGesture edgePanLeftGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   60
      LockedInPosition=   False
      MaxNumberOfTouches=   1
      MinNumberOfTouches=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   60
   End
   Begin iOSCanvas UnderRightEdgeCanvas
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   UnderRightEdgeCanvas, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   UnderRightEdgeCanvas, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   UnderRightEdgeCanvas, 1, <Parent>, 2, False, +1.00, 1, 1, 0, UnderRightEdgeCanvasLeft
      AutoLayout      =   UnderRightEdgeCanvas, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, 
      Height          =   460.0
      Left            =   320
      LockedInPosition=   False
      Scope           =   0
      Top             =   20
      Visible         =   True
      Width           =   0.0
   End
   Begin iOSGestures.edgePanRightGesture edgePanRightGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   140
      LockedInPosition=   False
      MaxNumberOfTouches=   1
      MinNumberOfTouches=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   140
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Activate()
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
		    UnderRightEdgeCanvas.Invalidate()
		  end if
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Table1
	#tag Event
		Sub Open()
		  me.AddSection("")
		  me.AddRow(0, "Tap >")
		  me.AddRow(0, "Long Press >")
		  me.AddRow(0, "Swipe >")
		  me.AddRow(0, "Pinch, Pan, and Rotate >")
		  'me.AddRow(0, "Edge Pan >")
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  #pragma unused section
		  
		  Dim newView As iOSView
		  
		  select case row
		    
		  case 0
		    newView = New TapView
		  case 1
		    newView = New LongPressView
		  case 2
		    newView = New SwipeView
		  case 3
		    newView = New PinchPanRotateView
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
#tag Events edgePanLeftGesture1
	#tag Event
		Sub PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.ClearEvents()
		  
		  
		  SetLeftEdgeCanvasWidth( 0 )
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
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
		Sub Paint(g As iOSGraphics)
		  g.FillColor = Color.Red
		  g.FillRect( 0, 0, g.Width, g.Height )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edgePanRightGesture1
	#tag Event
		Sub PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.ClearEvents()
		  
		  
		  SetRightEdgeCanvasLeft( self.size.width )
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #Pragma Unused translation
		  #Pragma Unused velocity
		  
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  SetRightEdgeCanvasLeft(  pos.x )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
