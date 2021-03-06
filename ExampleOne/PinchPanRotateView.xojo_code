#tag MobileScreen
Begin MobileScreen PinchPanRotateView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   0
   Title           =   "Pinch, Pan, and Rotate"
   Top             =   0
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, -33, , True
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   470
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
   Begin iOSGestures.panGesture panGesture1
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
   Begin iOSGestures.pinchGesture pinchGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin iOSGestures.rotateGesture rotateGesture1
      Enabled         =   True
      Gesture         =   "baseGesture"
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   0
   End
   Begin MobileLabel StatusOutput
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   1
      AutoLayout      =   StatusOutput, 1, Canvas1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatusOutput, 7, , 0, False, +1.00, 4, 1, 313, , True
      AutoLayout      =   StatusOutput, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatusOutput, 8, , 0, False, +1.00, 4, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   0
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   2
      Text            =   "<drawing status>"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   538
      Visible         =   True
      Width           =   313
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Property, Flags = &h0
		m_DrawRotation As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		m_DrawScale As Double = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		m_DrawTranslation As xojo.Point
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  App.DrawBorder( g )
		  
		  if (m_DrawTranslation <> nil) then
		    g.Translate( m_DrawTranslation.x, m_DrawTranslation.y  )
		  end if
		  
		  Dim rectSize as integer = 40 * m_DrawScale
		  Dim centerX as Double = g.Width/2
		  Dim centerY as Double = g.Height/2
		  
		  g.Rotate(m_DrawRotation, centerX, centerY)
		  
		  g.DrawRectangle( centerX-(rectSize/2), centerY-(rectSize/2), rectSize, rectSize )
		  
		  StatusOutput.Text = "Scale = " + m_DrawScale.toString( "#.000") + " : Rotation = " + m_DrawRotation.toString("#.000")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  panGesture1.Attach( Me )
		  pinchGesture1.Attach( Me )
		  rotateGesture1.Attach( Me )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events panGesture1
	#tag Event
		Sub PanChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawTranslation = translation
		  
		  Canvas1.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawTranslation = translation
		  
		  Canvas1.Refresh()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanBegins(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.Point, velocity as xojo.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawTranslation = translation
		  
		  Canvas1.Refresh()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pinchGesture1
	#tag Event
		Sub PinchChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawScale = scale
		  Canvas1.Refresh()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rotateGesture1
	#tag Event
		Sub rotationChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawRotation = rotation
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
		Name="m_DrawRotation"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="m_DrawScale"
		Visible=false
		Group="Behavior"
		InitialValue="1"
		Type="Double"
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
