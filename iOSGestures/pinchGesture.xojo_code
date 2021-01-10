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
		  
		  Dim fScale as CGFloat = Scale()
		  Dim fVelocity as CGFloat = Velocity()
		  
		  Dim pos as xojo.Point = Position()
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
		Delegate Sub pinchBeginsDelegate(recognizer as iosGestures.pinchGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub pinchChangedDelegate(recognizer as iosGestures.pinchGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub pinchEndsDelegate(recognizer as iosGestures.pinchGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Scale() As CGFloat
		  return UIKit.getScale( theRecognizer )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Velocity() As CGFloat
		  return UIKit.getVelocity( theRecognizer )
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PinchBegins(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PinchChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PinchEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, scale as CGFloat, velocity as CGFloat)
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Gesture"
			Visible=false
			Group="Behavior"
			InitialValue="baseGesture"
			Type="Text"
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
			Name="RecognizerType"
			Visible=false
			Group="Behavior"
			InitialValue="baseClass"
			Type="Text"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
