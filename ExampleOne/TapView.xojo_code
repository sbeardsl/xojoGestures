#tag IOSView
Begin iosView TapView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   "Tap"
   Title           =   "Tap"
   Top             =   0
   Begin iOSSegmentedControl TapsControl
      AutoLayout      =   TapsControl, 2, TouchesControl, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   TapsControl, 1, TouchesControl, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   TapsControl, 8, , 0, True, +1.00, 1, 1, 29, 
      AutoLayout      =   TapsControl, 4, TouchesControl, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      Enabled         =   True
      Height          =   29.0
      Left            =   60.0
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "Single Tap\n\nTrue\rDouble Tap\n\nFalse"
      Top             =   409.0
      Value           =   0
      Visible         =   True
      Width           =   200.0
   End
   Begin iOSSegmentedControl TouchesControl
      AutoLayout      =   TouchesControl, 7, , 0, False, +1.00, 1, 1, 200, 
      AutoLayout      =   TouchesControl, 8, , 0, True, +1.00, 1, 1, 29, 
      AutoLayout      =   TouchesControl, 9, <Parent>, 9, False, +1.00, 2, 1, 0, 
      AutoLayout      =   TouchesControl, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -5, 
      Enabled         =   True
      Height          =   29.0
      Left            =   60.0
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "One Finger\n\nTrue\rTwo Fingers\n\nFalse"
      Top             =   446.0
      Value           =   0
      Visible         =   True
      Width           =   200.0
   End
   Begin iosCanvas Canvas1
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 4, TapsControl, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      Height          =   336.0
      Left            =   0.0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   "nil"
      Scope           =   0
      Top             =   65.0
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSGestures.tapGesture tapGesture1
      Compatibility   =   ""
      Enabled         =   True
      Gesture         =   "baseGesture"
      Height          =   32
      Left            =   140
      LockedInPosition=   False
      NumberOfTapsRequired=   1
      NumberOfTouchesRequired=   1
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   140
      Width           =   32
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  tapGesture1.Attach( Canvas1.Handle )
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events TapsControl
	#tag Event
		Sub ValueChanged()
		  tapGesture1.NumberOfTapsRequired = me.Value + 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TouchesControl
	#tag Event
		Sub ValueChanged()
		  tapGesture1.NumberOfTouchesRequired = me.Value + 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  App.DrawBorder( g )
		  
		  if (App.LatestEventPos <> nil) then
		    App.DrawTap(g)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tapGesture1
	#tag Event
		Sub Tap(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = Me.numberOfTapsRequired()
		  
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
