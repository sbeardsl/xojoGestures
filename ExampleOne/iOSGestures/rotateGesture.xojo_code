#tag Class
Protected Class rotateGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h0
		Sub AttachRotationRecognizer(target as Ptr)
		  Attach( Target )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor("UIRotationGestureRecognizer")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  Dim fRotation as CGFloat = Rotation( )
		  Dim fVelocity as CGFloat = Velocity( )
		  
		  Dim pos as xojo.Point = Position()
		  Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		  
		  Select Case recState
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateBegan
		    RaiseEvent RotationBegins( pos, eventInfo, fRotation, fVelocity )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateChanged
		    RaiseEvent RotationChanged( pos, eventInfo, fRotation, fVelocity )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateEnded
		    RaiseEvent RotationEnds( pos, eventInfo, fRotation, fVelocity )
		  end Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotation() As CGFloat
		  return UIKit.getRotation( theRecognizer )
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub rotationBeginsDelegate(recognizer as iosGestures.rotateGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub rotationChangedDelegate(recognizer as iosGestures.rotateGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub rotationEndsDelegate(recognizer as iosGestures.rotateGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Velocity() As CGFloat
		  return UIKit.getVelocity(theRecognizer)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event rotationBegins(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event rotationChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event rotationEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo, rotation as CGFloat, velocity as CGFloat)
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
