#tag IOSView
Begin iosView EdgePanView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   "EdgePan"
   Title           =   "Edge Pan"
   Top             =   0
   Begin iOSSegmentedControl TouchesControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TouchesControl, 8, , 0, True, +1.00, 1, 1, 29, 
      AutoLayout      =   TouchesControl, 1, <Parent>, 1, False, +1.00, 2, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   TouchesControl, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -5, 
      AutoLayout      =   TouchesControl, 2, <Parent>, 2, False, +1.00, 2, 1, -*kStdGapCtlToViewH, 
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "One Finger\n\nTrue\rTwo Fingers\n\nFalse\r1 or 2 Fingers\n\nFalse"
      Top             =   446
      Value           =   0
      Visible         =   True
      Width           =   280.0
   End
   Begin iosCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, 
      Height          =   336.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSGestures.edgePanRightGesture edgePanRightGesture1
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
   Begin iOSGestures.edgePanLeftGesture edgePanLeftGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   80
      LockedInPosition=   False
      MaxNumberOfTouches=   1
      MinNumberOfTouches=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   80
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  edgePanLeftGesture1.Attach( Me.Handle )
		  edgePanRightGesture1.Attach( Me.Handle )
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		m_LeftEdgePanLine As xojo.Core.Point
	#tag EndProperty

	#tag Property, Flags = &h0
		m_RightEdgePanLine As xojo.Core.Point
	#tag EndProperty


#tag EndWindowCode

#tag Events TouchesControl
	#tag Event
		Sub ValueChanged()
		  Dim minTouches as integer = 1
		  Dim maxTouches as integer = 1
		  
		  Select Case me.Value
		  case 0 'One Finger
		    minTouches = 1
		    maxTouches = 1
		  case 1 'Two Fingers
		    minTouches = 2
		    maxTouches = 2
		  case 2 '1 or 2 Fingers
		    minTouches = 1
		    maxTouches =2
		  end Select
		  
		  edgePanLeftGesture1.MinNumberOfTouches = minTouches
		  edgePanLeftGesture1.MaxNumberOfTouches = maxTouches
		  
		  edgePanRightGesture1.MinNumberOfTouches = minTouches
		  edgePanRightGesture1.MaxNumberOfTouches = maxTouches
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  App.DrawBorder( g )
		  
		  
		  if (m_LeftEdgePanLine <> nil) then
		    g.FillColor = &cFF0000
		    g.FillRect( 0, 0, m_LeftEdgePanLine.x, g.height )
		  end if
		  
		  if (m_RightEdgePanLine <> nil) then
		    g.FillColor = &c00FF00
		    g.FillRect(g.Width - (g.Width-m_RightEdgePanLine.x), 0, g.width-m_RightEdgePanLine.x, g.height )
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edgePanRightGesture1
	#tag Event
		Sub PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #pragma unused translation
		  #pragma unused velocity
		  
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_RightEdgePanLine = pos
		  
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_RightEdgePanLine = pos
		  
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_LeftEdgePanLine = pos
		  
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events edgePanLeftGesture1
	#tag Event
		Sub PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  App.LatestEventPos = nil
		  App.LatestEventInfo = nil
		  App.LatestNumTaps = 0
		  
		  m_LeftEdgePanLine = nil
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_LeftEdgePanLine = pos
		  
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_LeftEdgePanLine = pos
		  
		  
		  Canvas1.Invalidate()
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
