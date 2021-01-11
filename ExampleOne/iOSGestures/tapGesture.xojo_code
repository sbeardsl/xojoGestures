#tag Class
Protected Class tapGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetIOS)
		Sub Constructor()
		  Super.Constructor("UITapGestureRecognizer")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetIOS)
		Sub Constructor(theView as Ptr, handler as iOSGestures.tapGesture.tapEventDelegate, taps as integer, touches as integer = 1, gestureName as String = "")
		  Super.Constructor("UITapGestureRecognizer")
		  
		  Name = gestureName
		  NumberOfTapsRequired = taps
		  NumberOfTouchesRequired = touches
		  AddHandler Tap, handler
		  
		  Attach( theView )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  if (recState = UIKit.UIGestureRecognizerState.UIGestureRecognizerStateRecognized) then
		    
		    Dim pos as xojo.Point = Position()
		    Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		    
		    RaiseEvent Tap( pos, eventInfo )
		    
		  end if
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub tapEventDelegate(recognizer as iosGestures.tapGesture, pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event Tap(pos as xojo.Point, eventInfo as iosGestures.gestureEventInfo)
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
			Name="NumberOfTapsRequired"
			Visible=true
			Group="Behavior"
			InitialValue="1"
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
