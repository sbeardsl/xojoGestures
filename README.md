xojoGestures 
============

iOSGestures will work with Xojo 2014 R3.2 and Xojo 2015 Release 2 and later.

WARNING - as of this release 64 bit support is untested - PLEASE report any problems

WARNING - iOSGestures is NOT compatible with Xojo 2015 Release 1.

iOSGestures is a Xojo module designed to make detecting user gestures such as
Tap, Swipe,  Pinch, and Rotate as easy a possible.   While its likely that gesture
events will be added to a future version of Xojo until then this makes adding them
easy so we can have fun playing with them starting now.

Supported Gestures:  (with configurable parameters)

* Tap (1-N taps by 1-N touches)

* Swipe (Left, Right, Up, Down, 1-N Touches)

* Long Press (1-N Touches, delay)

* Pinch, Rotate, Pan (1-N Touches)

* Edge Pan From(Left, Right, Top, Bottom, 1-N Touches)

Gestures may be attached to either a view (e.g. to detect a swipe over the entire
current view) or a specific control (e.g. to detect taps on a canvas).

You may attach a gesture recognizer either from the IDE by placing it on the shelf under
a view or directly from code.  

Update Apr-17th-2015
    iOSGestures is now compatible with Xojo 2015 Release 1.
    Updates to support 64 bit builds
    Some general code cleanup

Update Jan-13th-2014
    Added MultiTapButtonView which responds to both single and double taps to ExampleOne.
    Added "recognizerByName" which searches the list of currently attached recognizers for one with the requrested name"
    Addec "removeRecognizers(view or control)" and "removeRecognizersIncludingSubView(view or control)" to help with cleanup on Close events
    Removed unique delegate class for each gesture object, they all now share a single delegate class object.
    Minor cleanup of view methods in the Foundation and UIKit modules.

Special Thanks: To Michel Bujardet, the curator of XojoiOSWrapper, Jason King for many contributions to the Xojo community including the TableView setup I borrowed for ExampleOne, and the Xojo Team for the Xojo examples, especially for iosAlert for showing how to get the delegate for gesture events setup correctly.