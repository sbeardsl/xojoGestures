#tag Class
Protected Class pinchGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor("UIPinchGestureRecognizer")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  Dim fScale as Single = Scale()
		  Dim fVelocity as Single = Velocity()
		  
		  Dim pos as xojo.Core.Point = Position()
		  Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		  
		  Select Case recState
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateBegan
		    RaiseEvent PinchBegins( pos, eventInfo, fScale, fVelocity )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateChanged
		    RaiseEvent PinchChanged( pos, eventInfo, fScale, fVelocity )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateEnded
		    RaiseEvent PinchEnds( pos, eventInfo, fScale, fVelocity )
		  end Select
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub pinchBeginsDelegate(recognizer as iosGestures . pinchGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, scale as Single, velocity as Single)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub pinchChangedDelegate(recognizer as iosGestures . pinchGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, scale as Single, velocity as Single)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub pinchEndsDelegate(recognizer as iosGestures . pinchGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, scale as Single, velocity as Single)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Scale() As Single
		  return UIKit.getScale( theRecognizer )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Velocity() As Single
		  return UIKit.getVelocity( theRecognizer )
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PinchBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, scale as Single, velocity as Single)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PinchChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, scale as Single, velocity as Single)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PinchEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, scale as Single, velocity as Single)
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Gesture"
			Group="Behavior"
			InitialValue="baseGesture"
			Type="Text"
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
			Name="RecognizerType"
			Group="Behavior"
			InitialValue="baseClass"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
