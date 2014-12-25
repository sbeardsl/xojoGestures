#tag IOSView
Begin iosView LongPressView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   "LongPress"
   Title           =   "Long Press"
   Top             =   0
   Begin iOSSegmentedControl TouchesControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TouchesControl, 4, DelayControl, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      AutoLayout      =   TouchesControl, 9, <Parent>, 9, False, +1.00, 2, 1, 0, 
      AutoLayout      =   TouchesControl, 8, , 0, True, +1.00, 1, 1, 29, 
      AutoLayout      =   TouchesControl, 1, <Parent>, 1, False, +1.00, 2, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   TouchesControl, 2, <Parent>, 2, False, +1.00, 2, 1, -*kStdGapCtlToViewH, 
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "One Finger\n\nTrue\rTwo Fingers\n\nFalse"
      Top             =   406
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
      AutoLayout      =   Canvas1, 4, TouchesControl, 3, False, +1.00, 2, 1, -*kStdControlGapV, 
      Height          =   333.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSSegmentedControl DelayControl
      AutoLayout      =   DelayControl, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   DelayControl, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   DelayControl, 8, , 0, True, +1.00, 1, 1, 29, 
      AutoLayout      =   DelayControl, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, -*kStdControlGapV, 
      Enabled         =   True
      Height          =   29.0
      Left            =   20.0
      LockedInPosition=   False
      Scope           =   0
      Segments        =   ".5 seconds\n\nTrue\r2 seconds\n\nFalse\r5 seconds\n\nFalse"
      Top             =   443.0
      Value           =   0
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSGestures.longPressGesture longPressGesture1
      Compatibility   =   ""
      Enabled         =   True
      Gesture         =   "baseGesture"
      Height          =   32
      Left            =   140
      LockedInPosition=   False
      MinimumPressDuration=   0.5
      NumberOfTapsRequired=   0
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
		  longPressGesture1.Attach( Canvas1.Handle )
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
		Sub Paint(g As iOSGraphics)
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
		Sub LongPressBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub LongPressEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  
		  App.LatestEventPos = nil
		  App.LatestEventInfo = nil
		  App.LatestNumTaps = 0
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub LongPressChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
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
