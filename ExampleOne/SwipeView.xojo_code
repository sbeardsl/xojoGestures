#tag IOSView
Begin iosView SwipeView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   "2"
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   "SwipeTab"
   Title           =   "Swipe"
   Top             =   0
   Begin iOSSegmentedControl TouchesControl
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TouchesControl, 8, , 0, True, +1.00, 1, 1, 29, , True
      AutoLayout      =   TouchesControl, 7, , 0, False, +1.00, 1, 1, 200, , True
      AutoLayout      =   TouchesControl, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -5, , True
      AutoLayout      =   TouchesControl, 9, <Parent>, 9, False, +1.00, 2, 1, 0, , True
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   60
      LockedInPosition=   False
      Scope           =   0
      Segments        =   "One Finger\n\nTrue\rTwo Fingers\n\nFalse"
      Top             =   446
      Value           =   0
      Visible         =   True
      Width           =   200.0
   End
   Begin iOSGestures.swipeDownGesture swipeDownGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      NumberOfTouchesRequired=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin iOSGestures.swipeLeftGesture swipeLeftGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      NumberOfTouchesRequired=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin iOSGestures.swipeRightGesture swipeRightGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      NumberOfTouchesRequired=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin iOSGestures.swipeUpGesture swipeUpGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      NumberOfTouchesRequired=   1
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin iosCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 4, TouchesControl, 3, False, +1.00, 2, 1, -*kStdControlGapV, , True
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      Height          =   373.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  ' We pass the SwipeView.Handle instead of the canvas one so that we watch the entire view, not just the canvas for swipes
		  
		  swipeLeftGesture1.Attach( Me )
		  swipeRightGesture1.Attach( Me )
		  swipeUpGesture1.Attach( Me )
		  swipeDownGesture1.Attach( Me )
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected m_SwipeDirection As iOSGestures.UIKit.UISwipeDirection
	#tag EndProperty


#tag EndWindowCode

#tag Events TouchesControl
	#tag Event
		Sub ValueChanged()
		  swipeUpGesture1.NumberOfTouchesRequired = me.Value + 1
		  swipeDownGesture1.NumberOfTouchesRequired = me.Value + 1
		  swipeLeftGesture1.NumberOfTouchesRequired = me.Value + 1
		  swipeRightGesture1.NumberOfTouchesRequired = me.Value + 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events swipeDownGesture1
	#tag Event
		Sub Swipe(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_SwipeDirection = iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionDown
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events swipeLeftGesture1
	#tag Event
		Sub Swipe(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_SwipeDirection = iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionLeft
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events swipeRightGesture1
	#tag Event
		Sub Swipe(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_SwipeDirection = iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionRight
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events swipeUpGesture1
	#tag Event
		Sub Swipe(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  App.LatestEventPos = pos
		  App.LatestEventInfo = eventInfo
		  App.LatestNumTaps = 0
		  
		  m_SwipeDirection = iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionUp
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  App.DrawBorder( g )
		  
		  
		  if (m_SwipeDirection <> iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionNone) then
		    Select Case m_SwipeDirection
		    case  iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionLeft
		      App.DrawSwipeLeft( g )
		    case iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionRight
		      App.DrawSwipeRight( g )
		    case iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionUp
		      App.DrawSwipeUp( g )
		    case iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionDown
		      App.DrawSwipeDown( g )
		    end Select
		    
		    m_SwipeDirection = iOSGestures.UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionNone
		    
		  end if
		  
		  
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
