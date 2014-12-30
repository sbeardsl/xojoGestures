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
		  
		  Dim fRotation as Single = Rotation( )
		  Dim fVelocity as Single = Velocity( )
		  
		  Dim pos as xojo.Core.Point = Position()
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
		Function Rotation() As Single
		  return UIKit.getRotation( theRecognizer )
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub rotationBeginsDelegate(recognizer as iosGestures . rotateGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, rotation as Single, velocity as Single)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub rotationChangedDelegate(recognizer as iosGestures . rotateGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, rotation as Single, velocity as Single)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub rotationEndsDelegate(recognizer as iosGestures . rotateGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, rotation as Single, velocity as Single)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Velocity() As Single
		  return UIKit.getVelocity(theRecognizer)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event rotationBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, rotation as Single, velocity as Single)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event rotationChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, rotation as Single, velocity as Single)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event rotationEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, rotation as Single, velocity as Single)
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