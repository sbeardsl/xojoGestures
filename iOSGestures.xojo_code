#tag Module
Protected Module iOSGestures
	#tag Note, Name = About iOSGestures Module
		Updated: 12-13-14 @ 10:00PM
		
		Apple ios Documentation on the UIGestureRecognizer
		https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIGestureRecognizer_Class/index.html#//apple_ref/occ/cl/UIGestureRecognizer
		
		NumberOfTouches ( )
		NumberOfTaps ( )
		MinimumPressDuration (LongPress)
		
		
		m_swipeLeft = new iosGestures.swipeLeftGesture( 1, Handle )
		AddHandler m_swipeLeft.Swipe, AddressOf localSwipeHandler
		
		Protected Sub localSwipeHandler(recognizer as iosGestures.swipeGesture, pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		Dim typeOfGesture as Text = recognizer.GetTheRecognizerType()
		Dim nTouchesExpected  as integer = recognizer.NumberOfTouchesRequired()
		
		// These may change over time, they are read directly from the recovnizer and so may change inside your event hander
		Dim nTouchesReceived  as integer = recognizer.NumberOfTouches()
		Dim logicalPositonOfGesture as xojo.Core.point= pos  'usually mid point of all touches but depends on gesture
		
		// from eventInfo, info from event cached for future reference
		// eventInfo is NOT an iOSEventInfo object, it just works a lot like one
		Dim timeStampOfGesture as Double = eventInfo.TimeStamp() ' not guaranted equal to TimeStamps of canvas Pointer events
		Dim nTouchesInEventInfo as integer = eventInfo.PointerCount()  ' should equal nTouchesReceived
		Dim nPositionOfTouchOne as xojo.Core.Point = eventInfo.PointerPosition( 0 )
		
		End Sub
		
	#tag EndNote


	#tag ViewBehavior
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
End Module
#tag EndModule
