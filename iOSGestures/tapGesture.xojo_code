#tag Class
Protected Class tapGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetIOS)
		Sub Constructor()
		  Super.Constructor("UITapGestureRecognizer")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  if (recState = UIKit.UIGestureRecognizerState.UIGestureRecognizerStateRecognized) then
		    
		    Dim pos as xojo.Core.Point = Position()
		    Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		    
		    RaiseEvent Tap( pos, eventInfo )
		    
		  end if
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub tapEventDelegate(recognizer as iosGestures . tapGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo)
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event Tap(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mNumberOfTapsRequired As Integer = 1
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
			Name="NumberOfTapsRequired"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfTouchesRequired"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
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
