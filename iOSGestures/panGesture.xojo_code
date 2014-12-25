#tag Class
Protected Class panGesture
Inherits iosGestures.baseGestureRecognizer
	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor("UIPanGestureRecognizer")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.getRecognizerState( recognizer )
		  
		  Dim translation as xojo.core.Point = TranslationInView()
		  Dim velocity as xojo.core.Point = VelocityinView()
		  
		  Dim pos as xojo.Core.Point = Position()
		  Dim eventInfo as gestureEventInfo = CurrentEventInfo()
		  
		  Select Case recState
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateBegan
		    RaiseEvent PanBegins( pos, eventInfo, translation, velocity )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateChanged
		    RaiseEvent PanChanged( pos, eventInfo, translation, velocity )
		    
		  Case UIKit.UIGestureRecognizerState.UIGestureRecognizerStateEnded
		    RaiseEvent PanEnds( pos, eventInfo, translation, velocity )
		  end Select
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub panBeginsDelegate(recognizer as iosGestures . panGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, translationInView as xojo . Core . Point, velocityInView as xojo . Core . Point)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub panChangedDelegate(recognizer as iosGestures . panGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, translationInView as xojo . Core . Point, velocityInView as xojo . Core . Point)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub panEndsDelegate(recognizer as iosGestures . panGesture, pos as xojo . Core . Point, eventInfo as iosGestures . gestureEventInfo, translationInView as xojo . Core . Point, velocityInView as xojo . Core . Point)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ReferenceView() As Ptr
		  return GetTheTargetViewHandle()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TranslationInView() As xojo.Core.Point
		  return UIKit.getTranslationInView( theRecognizer, ReferenceView() )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VelocityInView() As xojo.Core.Point
		  return UIKit.getVelocityInView( theRecognizer, ReferenceView())
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PanBegins(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PanChanged(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PanEnds(pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo, translation as xojo.core.Point, velocity as xojo.core.Point)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  UIKit.maxNumberOfTouches.test( theRecognizer, mMaxNumberOfTouches, CurrentMethodName )
			  
			  return mMaxNumberOfTouches
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  UIKit.maxNumberOfTouches.set( theRecognizer, value, CurrentMethodName )
			  
			  mMaxNumberOfTouches = value
			End Set
		#tag EndSetter
		MaxNumberOfTouches As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  UIKit.minNumberOfTouches.test( theRecognizer, mMinNumberOfTouches, CurrentMethodName )
			  
			  return mMinNumberOfTouches
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  UIKit.minNumberOfTouches.set( theRecognizer, value, CurrentMethodName )
			  
			  mMinNumberOfTouches = value
			End Set
		#tag EndSetter
		MinNumberOfTouches As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMaxNumberOfTouches As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMinNumberOfTouches As Integer = 1
	#tag EndProperty


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
			Name="MaxNumberOfTouches"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinNumberOfTouches"
			Visible=true
			Group="Behavior"
			InitialValue="1"
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
