#tag MobileScreen
Begin MobileScreen LongPressView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   ""
   Title           =   "Long Press"
   Top             =   0
   Begin iOSSegmentedControl TouchesControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TouchesControl, 1, <Parent>, 1, False, +1.00, 2, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   TouchesControl, 9, <Parent>, 9, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   TouchesControl, 4, DelayControl, 3, False, +1.00, 1, 1, -*kStdControlGapV, , True
      AutoLayout      =   TouchesControl, 8, , 0, True, +1.00, 1, 1, 29, , True
      AutoLayout      =   TouchesControl, 2, <Parent>, 2, False, +1.00, 2, 1, -*kStdGapCtlToViewH, , True
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "One Finger\n\nTrue\rTwo Fingers\n\nFalse"
      Top             =   494
      Value           =   0
      Visible         =   True
      Width           =   280.0
   End
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 4, TouchesControl, 3, False, +1.00, 2, 1, -*kStdControlGapV, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, , True
      Enabled         =   True
      Height          =   421
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320
   End
   Begin iOSSegmentedControl DelayControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   DelayControl, 8, , 0, True, +1.00, 1, 1, 29, , True
      AutoLayout      =   DelayControl, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   DelayControl, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   DelayControl, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, -*kStdControlGapV, , True
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Segments        =   ".5 seconds\n\nTrue\r2 seconds\n\nFalse\r5 seconds\n\nFalse"
      Top             =   531
      Value           =   0
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSGestures.longPressGesture longPressGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      MinimumPressDuration=   0.5
      NumberOfTapsRequired=   0
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
	#tag Event
		Sub Opening()
		  longPressGesture1.Attach( Canvas1 )
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events TouchesControl
	#tag Event
		Sub ValueChanged()
		  longPressGesture1.NumberOfTouchesRequired = me.Value + 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  App.DrawBorder( g )
		  
		  if (App.LatestEventPos <> nil) then
		    App.DrawPress(g)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DelayControl
	#tag Event
		Sub ValueChanged()
		  Dim delaysByValue() as Double = Array(.5,2,5)
		  Dim newDelay as double = delaysByValue( Me.Value )
		  
		  longPressGesture1.MinimumPressDuration = newDelay
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events longPressGesture1
	#tag Event
		Sub LongPressBegins(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  Canvas1.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub LongPressEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  
		  App.LatestEventPos = nil
		  App.LatestEventInfo = nil
		  App.LatestNumTaps = 0
		  
		  Canvas1.Refresh()
		End Sub
	#tag EndEvent
	#tag Event
		Sub LongPressChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  Canvas1.Refresh()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
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
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
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
