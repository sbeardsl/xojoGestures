#tag Class
Protected Class longPressGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetIOS)
		Sub Constructor()
		  Super.Constructor("UILongPressGestureRecognizer")
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  Dim pos as xojo.Point = Position()
		  Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		  
		  Select Case recState
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateBegan
		    RaiseEvent LongPressBegins( pos, eventInfo )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateChanged
		    RaiseEvent LongPressChanged( pos, eventInfo )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateEnded
		    RaiseEvent LongPressEnds( pos, eventInfo )
		  end Select
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub longPressBeginsDelegate(recognizer as iosGestures.longPressGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub longPressChangedDelegate(recognizer as iosGestures.longPressGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub longPressEndsDelegate(recognizer as iosGestures.longPressGesture, pos as Xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event LongPressBegins(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LongPressChanged(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LongPressEnds(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  UIKit.minimumPressDuration.test( theRecognizer, mMinimumPressDuration, CurrentMethodName )
			  
			  return mMinimumPressDuration
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  UIKit.minimumPressDuration.set( theRecognizer, value, CurrentMethodName )
			  
			  mMinimumPressDuration = value
			End Set
		#tag EndSetter
		MinimumPressDuration As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMinimumPressDuration As Double = .5
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumberOfTapsRequired As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumberOfTouchesRequired As Integer = 1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  UIKit.numberOfTapsRequired.test( theRecognizer, mNumberOfTapsRequired, CurrentMethodName )
			  
			  return mNumberOfTapsRequired
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  UIKit.numberOfTapsRequired.set( theRecognizer, value, CurrentMethodName )
			  
			  mNumberOfTapsRequired = value
			End Set
		#tag EndSetter
		NumberOfTapsRequired As Integer
	#tag EndComputedProperty

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
			Name="MinimumPressDuration"
			Visible=true
			Group="Behavior"
			InitialValue=".5"
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
			Name="NumberOfTapsRequired"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
