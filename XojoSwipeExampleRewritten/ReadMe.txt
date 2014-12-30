This is the Xojo SwipeExample project rewritten using the iOSGesture module’s swipeLeft, swipeRight, swipeUp, and swipeDownGestures objects.

What was done:

[0 - To make the example work on an iPad you need to delete the SwipeCanvas’s Auto-Layout Width property.  
The Right = Parent.Right will do the correct thing while the fixed value will only cover part of an iPads screen area.

1) Open the SwipeExample project from the Xojo/Example Projects/iOS folder
Run the project and see what happens when you swipe left, right, up, and down

2) Open iOSGesture_module using File:Open in Xojo

3) Copy the iOSGesture module from there and Paste into the SwipeExample project.
[Now would be a good time to save the project with a new name]

4) Select View1 then drag a 
swipeLeftGesture
swipeRightGesture
swipeUpGesture
swipeDownGesture
to the shelf under View1

5) Open SwipeCanvas and delete the PointerDown and PointerDrag events

6) To the SwipeCanvas add an Open Event handler with the following code:
  swipeLeftGesture1.Attach( Me )
  swipeRightGesture1.Attach( Me  )
  swipeUpGesture1.Attach( Me  )
  swipeDownGesture1.Attach( Me  )
This will limit the recognizers to watching for swipes only on the SwipeCanvas.
You MUST use the Attach method to connect each recognizer to a View or Control before it will be able to report gesture events.

7) Now add an event handler for the Swipe event for each swipeGesture with the following code
For Left:  
	BottomSwipeLabel.Text = "Swiped left"    
For Right: 
	BottomSwipeLabel.Text = "Swiped right"
For Down:
	BottomSwipeLabel.Text = "Swiped down"
For Up: 
	BottomSwipeLabel.Text = "Swiped up"

8) Save the project someplace with a new name.
[You must do this so Xojo updates its event handler info, Feedback Ref #37005, 36698 (now closed)]

9) Now run and notice that Up and Down swipes will be correctly detected now.

Now we will add a one finger/single tap hander in code:

10)  Add the following property to View1’s property list:
m_Tap with Type iOSGestures.tapGesture

11) Add a method for the recognizer to call when a tap happens
Method Name: TapHandler 
Parameters: (copy the tapGesture’s tapEventDelegates Parameters)
recognizer as iosGestures.tapGesture, pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo

Add the following line of code to TapHandler:
BottomSwipeLabel.Text = "Tap! from " + recognizer.name

11) Add an Open event handler to View1 and in it place this code:

   ' Initialize the tap gesture recognizer
  m_Tap = new iOSGestures.tapGesture()
  
  ' Set the name of the tap handler in case we want to respond to multiple gestures with a single method
  ' (this could also be done using the recognizer pointers)
  m_Tap.Name = "SingleTapSingleFinger"
  
  ' We want to respond to a single tap made with a single finger
  m_Tap.NumberOfTapsRequired = 1
  m_Tap.NumberOfTouchesRequired = 1
  
  ' When we get a tap, report in with 
  AddHandler m_Tap.Tap, AddressOf TapHandler
   
  ' Respond to tap only within SwipeCanvas
  m_Tap.Attach( SwipeCanvas )

