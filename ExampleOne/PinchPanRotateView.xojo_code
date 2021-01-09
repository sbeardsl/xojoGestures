#tag IOSView
Begin iosView PinchPanRotateView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   "2"
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   "Tap"
   Title           =   "Pinch, Pan, and Rotate"
   Top             =   0
   Begin iosCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Canvas1, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, , True
      Height          =   415.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
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
End
#tag EndIOSView

#tag WindowCode
	#tag Property, Flags = &h0
		m_DrawRotation As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		m_DrawScale As Double = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		m_DrawTranslation As xojo.Core.Point
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As iOSGraphics)
		  App.DrawBorder( g )
		  
		  if (m_DrawTranslation <> nil) then
		    g.Translate( m_DrawTranslation.x, m_DrawTranslation.y  )
		  end if
		  
		  Dim rectSize as integer = 40 * m_DrawScale
		  Dim centerX as Double = g.Width/2
		  Dim centerY as Double = g.Height/2
		  
		  g.Rotate(m_DrawRotation, centerX, centerY)
		  
		  g.DrawRect( centerX-(rectSize/2), centerY-(rectSize/2), rectSize, rectSize )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  panGesture1.Attach( Me )
		  pinchGesture1.Attach( Me )
		  rotateGesture1.Attach( Me )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events panGesture1
	#tag Event
		Sub PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawTranslation = translation
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawTranslation = translation
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawTranslation = translation
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pinchGesture1
	#tag Event
		Sub PinchChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, scale as Single, velocity as Single)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawScale = scale
		  Canvas1.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rotateGesture1
	#tag Event
		Sub rotationChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, rotation as Single, velocity as Single)
		  #Pragma Unused pos
		  #Pragma Unused eventInfo
		  #Pragma Unused velocity
		  
		  m_DrawRotation = rotation
		  Canvas1.Invalidate
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
