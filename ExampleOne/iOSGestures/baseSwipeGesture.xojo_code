#tag Class
Protected Class baseSwipeGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor("UISwipeGestureRecognizer")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  if (recState = UIKit.UIGestureRecognizerState.UIGestureRecognizerStateRecognized) then
		    
		    Dim pos as xojo.Point = Position()
		    Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		    
		    RaiseEvent Swipe( pos, eventInfo )
		    
		  end if
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub swipeEventDelegate(recognizer as iosGestures . baseSwipeGesture, pos as Xojo . Point, eventInfo as iosGestures . gestureEventInfo)
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event Swipe(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  UIKit.swipeDirection.test( theRecognizer, mDirection, CurrentMethodName )
			  
			  return mDirection
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  UIKit.swipeDirection.set( theRecognizer, value, CurrentMethodName )
			  
			  mDirection = value
			End Set
		#tag EndSetter
		Direction As UIKit.UISwipeDirection
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDirection As UIKit.UISwipeDirection = UIKit.UISwipeDirection.UISwipeGestureRecognizerDirectionRight
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumberOfTouchesRequired As Integer = 1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  UIKit.numberOfTouchesRequired.test( theRecognizer, mNumberOfTouchesRequired, CurrentMethodName )
			  
			  return mNumberOfTouchesRequired
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  UIKit.numberOfTouchesRequired.set( theRecognizer, value, CurrentMethodName )
			  
			  mNumberOfTouchesRequired = value
			End Set
		#tag EndSetter
		NumberOfTouchesRequired As Integer
	#tag EndComputedProperty


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
			Name="NumberOfTouchesRequired"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
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
