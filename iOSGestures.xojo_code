#tag Module
Protected Module iOSGestures
	#tag Method, Flags = &h0
		Function recognizerByName(sName as Text) As iOSGestures.baseGestureRecognizer
		  return baseGestureRecognizer.recognizerByName( sName )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub removeRecognizers(extends theControl as iOSControl)
		  iOSGestures.baseGestureRecognizer.RemoveRecognizers( theControl.Handle )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub removeRecognizers(extends theView as iOSView)
		  iOSGestures.baseGestureRecognizer.RemoveRecognizers( UIViewPtrFromView( theView ) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub removeRecognizersIncludingSubViews(theControl as iOSControl)
		  iOSGestures.baseGestureRecognizer.RemoveRecognizersIncludingSubViews( theControl.Handle )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub removeRecognizersIncludingSubViews(theView as iOSView)
		  iOSGestures.baseGestureRecognizer.RemoveRecognizersIncludingSubViews( UIViewPtrFromView( theView ) )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub respondsToTap(extends theControl as iOSControl, handler as iOSGestures.tapGesture.tapEventDelegate, taps as integer, touches as integer, name as Text)
		  Dim newRecognizer as iOSGestures.tapGesture = new iOSGestures.tapGesture( theControl.Handle, handler, taps, touches, name )
		  
		  'A reference to the recognizer is kept in baseGestureRecognizer.m_dictofRecognizers so this won't go away when we exit the method
		  #Pragma unused newRecognizer
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub respondsToTap(extends theControl as iOSControl, handler as iOSGestures.tapGesture.tapEventDelegate, taps as integer, name as Text)
		  Dim newRecognizer as iOSGestures.tapGesture = new iOSGestures.tapGesture( theControl.Handle, handler, taps, 1, name )
		  
		  'A reference to the recognizer is kept in baseGestureRecognizer.m_dictofRecognizers so this won't go away when we exit the method
		  #Pragma unused newRecognizer
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub respondsToTap(extends theView as iOSView, handler as iOSGestures.tapGesture.tapEventDelegate, taps as integer, touches as integer, name as Text)
		  Dim newRecognizer as iOSGestures.tapGesture = new iOSGestures.tapGesture( theView.Handle, handler, taps, touches, name )
		  
		  'A reference to the recognizer is kept in baseGestureRecognizer.m_dictofRecognizers so this won't go away when we exit the method
		  #Pragma unused newRecognizer
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub respondsToTap(extends theView as iOSView, handler as iOSGestures.tapGesture.tapEventDelegate, taps as integer, name as Text)
		  Dim newRecognizer as iOSGestures.tapGesture = new iOSGestures.tapGesture( theView.Handle, handler, taps, 1, name )
		  
		  'A reference to the recognizer is kept in baseGestureRecognizer.m_dictofRecognizers so this won't go away when we exit the method
		  #Pragma unused newRecognizer
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UIViewPtrFromView(theView as iOSView) As Ptr
		  Dim theViewPtr as Ptr = theView.Handle
		  
		  if (not Foundation.isKindOfClass( theViewPtr, "UIView" )) then
		    
		    if (Foundation.objRespondsTo( theViewPtr, "view" )) then
		      theViewPtr = UIKit.view( theViewPtr )
		      
		      if (not Foundation.isKindOfClass( theViewPtr, "UIView" ))  then
		        theViewPtr = nil
		      end if
		    end if
		  end if
		  
		  return theViewPtr
		End Function
	#tag EndMethod


	#tag Note, Name = About iOSGestures Module
		xojoGestures
		============
		
		iOSGestures is a Xojo module designed to make detecting user gestures such as
		Tap, Swipe,  Pinch, and Rotate as easy a possible.   While its likely that gesture
		events will be added to a future version of Xojo until then this makes adding them
		easy so we can have fun playing with them starting now.
		
		Supported Gestures:  (with configurable parameters)
		Tap (1-N taps by 1-N touches)
		Swipe (Left, Right, Up, Down, 1-N Touches)
		Long Press (1-N Touches, delay)
		Pinch, Rotate, Pan (1-N Touches)
		Edge Pan From(Left, Right, Top, Bottom, 1-N Touches)
		[Touches are called fingers by most users so a "two-finger swipe" is a swipe with nNumTouchesRequired set to 2 in iOS speak.]
		
		Gestures may be attached to either a view (e.g. to detect a swipe over the entire
		current view) or a specific control (e.g. to detect taps on a canvas).
		
		You may attach a gesture recognizer either from the IDE by placing it on the shelf under
		a view or directly from code.
		
		If you drag a gesture to your view's shelf:
		You MUST add the following line of code to the view or canvas's Open or Activate event:
		theGesture.Attach(yourView)
		or
		theGesture.Attach(yourCanvas)
		
		To create and attach a gesture in code:
		Dim myGesture as swipeLeftGesture   ' watch for a swipe to the left'
		myGesture = new swipeLeftGesture()
		
		' Initalize properties such a how many taps or fingers for your gesture
		myGesture.numTouchesRequired = 2 'respond to a two-fingered left swipe
		
		' Attach an event handler to one or more of the gesture's events
		AddHandler myGesture.Swipe, AddressOf swipeHandler
		[To get the parameters for your eventHandler method, copy the Parameters list
		from the gesture’s EventDelegate for the corresponding event.
		For example, to get the parameter list for swipeLeftGesture’s Swipe event
		copy the parameter list from baseSwipeGesture’s swipeEventDelegate
		“recognizer as iosGestures.baseSwipeGesture, pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo”]
		
		' finally, attach the gesture recognizer to a canvas or view
		myGesture.Attach( myView )
		
		To see the module in action run the ExampleOne which shows off most of the supported gestures.
		
		[Note: Xojo 2014 3.0 and 3.1 have a bug with importing modules containing classes. (Feedback #37436, fixed Dec 19th)
		Until an update with the fix is released you will need to copy and paste
		from after opening the iOSGesture_module instead of importing the module directly.]
		
		To begin experimenting for yourself:
		1) Create a new iOS Project
		2) Open iosGesutres_module, Copy iOSGestures, and Paste it into your project.
		3) Select a view (e.g. View1)
		4) Open the iOSGesture module list of classes
		5) Drag a copy of tapGesture to the shelf under your View.
		[As of 3.0/3.1 you need to save your project after dragging a gesture object to the shelf, Feedback #37005, #36698]
		6) Add an Open event handler to your View and add "tapGesture1.Attach(Me)" to connect the gesture to your view
		7) Add a "Tap" event handler the tapGesture1 and add code
		
		8) You can drag a second tapGesture to the shelf (Save) and set its NumberOfTapsRequired
		to 2 to create an event handler for double taps.  Since we are using Apple's system
		recognizers we don't have to worry about sorting out what is a single or double tap,
		and your app will exhibit correct behavior when the user has enabled some
		of the accessibility features in the OS.
		
		Special Thanks:
		To Michel Bujardet, the curator of XojoiOSWrapper and Jason King for many contributions
		to the Xojo community including the TableView setup I borrowed for ExampleOne.
		
		To the Xojo Team, first for the Xojo examples, especially for iosAlert without which I
		would probably still be stumbling over getting the delegate for gesture events setup
		correctly. More importantly, I'm blown away by the stability of the first release of
		Xojo for iOS.  Great job and I'm really looking forward to what comes next including
		making this module obsolete when you add gesture events to Views and Controls
		directly from the Xojo iOS Framework.
		
		For those who want to go deeper - Apple ios Documentation on the UIGestureRecognizer
		
		https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIGestureRecognizer_Class/index.html#//apple_ref/occ/cl/UIGestureRecognizer
		
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
