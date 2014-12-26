xojoGestures
============

XoJo module for attaching UIGestureRecognizers to Views

iOSGestures is a Xojo module designed to make detecting user gestures such as Tap, Swipe, Pinch, and Rotate as easy a possible.   While its certainly possible that gesture events will be adding to a future version of Xojo until then this makes adding them easy and they can be a lot of fun to play with.

Supported Gestures:  (with configurable parameters)
Tap (1-N taps by 1-N touches)
Swipe (Left, Right, Up, Down, 1-N Touches)
Long Press (1-N Touches, delay)
Pinch, Rotate, Pan (1-N Touches)
Edge Pan From(Left, Right, Top, Bottom, 1-N Touches)

Gestures may be attached to either a view (e.g. to detect a swipe over the entire current view) or a specific control (e.g. to detect taps on a canvas).

You may attach a gesture recognizer either from the IDE by placing it on the shelf under a view and or directly from code.  If you drag a gesture to the shelf you MUST add the following line of code to your Open or Activate event:
[B]theGesture.Attach(yourView.Handle) or theGesture.Attach(yourControl.Handle)[/B]

To see the module in action run the ExampleOne which shows off most of the supported gestures. 

[Note: When a version of Xojo that fixes 3.x's problem with importing a module with classes I'll add a binary copy of the module but for now, please copy and paste from the GestureBase project, its the only way I seem to be able to get it to work.]

To begin experimenting for yourself: 
1) Create a new iOS Project and copy the iOSGestures Module from XojoiOSGesturesBase.xojo_binary_project and paste it into your project.
2) Select your view
3) Open the iOSGesture module listing of classes
4) Drag a copy of tapGesture to the shelf under your View.
5) Add an Open event handler to your View and add "tapGesture1.Attach(View1.Handle)" to connect the gesture to your view
6) Add a "Tap" event handler the tapGesture1/
7) You are now ready to add code to handle tap events.
8) You can drag a second tapGesture to the shelf and modify its NumberOfTapsRequired to 2 to create an event handler for double taps.  Since we are using Apple's system recognizers we don't have to worry about sorting out what is a single or double tap, its taken care of for us including correct behavior when the user has enabled some of the accessibility features in the OS.'


Warning: This is my first public GitHub project, there will be a bit of churn as I work out exactly what the best way to organize the project to provide access and receive feedback.    

Special Thanks: 
To Michel Bujardet, for XojoiOSWrapper and his TableView setup for sample code, which I stole shamelessly and for the inspiration to release this to the larger Xojo community.

To the Xojo Team, first for the Xojo examples, especially for iosAlert without which I would probably still be stumbling over getting the delegate for gesture events setup correctly. More importantly, I'm blown away by the stability of the first release of Xojo for iOS.  Great job and I'm really looking forward to what comes next including making this module obsolete when you add gesture events to Views and Controls directly from the Xojo iOS Framework.

For those who want to go deeper - Apple ios Documentation on the UIGestureRecognizer

https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIGestureRecognizer_Class/index.html#//apple_ref/occ/cl/UIGestureRecognizer
