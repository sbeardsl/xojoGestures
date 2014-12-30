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

Gestures may be attached to either a view (e.g. to detect a swipe over the entire
current view) or a specific control (e.g. to detect taps on a canvas).

You may attach a gesture recognizer either from the IDE by placing it on the shelf under
a view or directly from code.  

Special Thanks:

To Michel Bujardet, for XojoiOSWrapper and his TableView setup for sample code, which I
stole shamelessly and for the inspiration to release this to the larger Xojo community.

To the Xojo Team, first for the Xojo examples, especially for iosAlert without which I
would probably still be stumbling over getting the delegate for gesture events setup
correctly. More importantly, I'm blown away by the stability of the first release of
Xojo for iOS.  Great job and I'm really looking forward to what comes next including
making this module obsolete when you add gesture events to Views and Controls
directly from the Xojo iOS Framework.

For those who want to go deeper - Apple ios Documentation on the UIGestureRecognizer

https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIGestureRecognizer_Class/index.html#//apple_ref/occ/cl/UIGestureRecognizer