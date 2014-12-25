#tag IOSView
Begin iosView PinchPanRotateView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   "Tap"
   Title           =   "Pinch, Pan, and Rotate"
   Top             =   0
   Begin iosCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 3, TopLayoutGuide, 4, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Canvas1, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, 
      Height          =   415.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSGestures.panGesture panGesture1
      Compatibility   =   ""
      Enabled         =   True
      Gesture         =   "baseGesture"
      Height          =   32
      Left            =   60
      LockedInPosition=   False
      MaxNumberOfTouches=   1
      MinNumberOfTouches=   1
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   60
      Width           =   32
   End
   Begin iOSGestures.pinchGesture pinchGesture1
      Compatibility   =   ""
      Enabled         =   True
      Gesture         =   "baseGesture"
      Height          =   32
      Left            =   80
      LockedInPosition=   False
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   80
      Width           =   32
   End
   Begin iOSGestures.rotateGesture rotateGesture1
      Compatibility   =   ""
      Enabled         =   True
      Gesture         =   "baseGesture"
      Height          =   32
      Left            =   100
      LockedInPosition=   False
      RecognizerType  =   "baseClass"
      Scope           =   1
      Top             =   100
      Width           =   32
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  panGesture1.Attach( Canvas1.Handle )
		  pinchGesture1.Attach( Canvas1.Handle )
		  rotateGesture1.Attach( Canvas1.Handle )
		End Sub
	#tag EndEvent


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
#tag EndEvents
#tag Events panGesture1
	#tag Event
		Sub PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  m_DrawTranslation = translation
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  m_DrawTranslation = translation
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
	#tag Event
		Sub PanBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
		  m_DrawTranslation = translation
		  
		  Canvas1.Invalidate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pinchGesture1
	#tag Event
		Sub PinchChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, scale as Single, velocity as Single)
		  m_DrawScale = scale
		  Canvas1.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rotateGesture1
	#tag Event
		Sub rotationChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, rotation as Single, velocity as Single)
		  m_DrawRotation = rotation
		  Canvas1.Invalidate
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
