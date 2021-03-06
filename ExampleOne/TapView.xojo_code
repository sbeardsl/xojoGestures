#tag MobileScreen
Begin MobileScreen TapView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   ""
   Title           =   "Tap"
   Top             =   0
   Begin iOSSegmentedControl TapsControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TapsControl, 1, TouchesControl, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TapsControl, 8, , 0, True, +1.00, 1, 1, 29, , True
      AutoLayout      =   TapsControl, 2, TouchesControl, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   TapsControl, 4, TouchesControl, 3, False, +1.00, 1, 1, -*kStdControlGapV, , True
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   60
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "Single Tap\n\nTrue\rDouble Tap\n\nFalse"
      Top             =   497
      Value           =   0
      Visible         =   True
      Width           =   200.0
   End
   Begin iOSSegmentedControl TouchesControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TouchesControl, 8, , 0, True, +1.00, 1, 1, 29, , True
      AutoLayout      =   TouchesControl, 9, <Parent>, 9, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   TouchesControl, 7, , 0, False, +1.00, 1, 1, 200, , True
      AutoLayout      =   TouchesControl, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -5, , True
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   60
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "One Finger\n\nTrue\rTwo Fingers\n\nFalse"
      Top             =   534
      Value           =   0
      Visible         =   True
      Width           =   200.0
   End
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 4, TapsControl, 3, False, +1.00, 1, 1, -*kStdControlGapV, , True
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   424
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
   Begin iOSGestures.tapGesture tapGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      NumberOfTapsRequired=   1
      NumberOfTouchesRequired=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
End
#tag EndMobileScreen

#tag WindowCode
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
		Sub Paint(g As Graphics)
		  App.DrawBorder( g )
		  
		  if (App.LatestEventPos <> nil) then
		    App.DrawTap(g)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  tapGesture1.Attach( Me )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tapGesture1
	#tag Event
		Sub Tap(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = Me.numberOfTapsRequired()
		  
		  Canvas1.Refresh()
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
