#tag IOSView
Begin iosView MultiTapButtonView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   "MultiTapButtonTab"
   Title           =   "Multi-Tap Button"
   Top             =   0
   Begin iOSButton MultiTapBtn
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   MultiTapBtn, 7, , 0, False, +1.00, 2, 1, 300, 
      AutoLayout      =   MultiTapBtn, 9, <Parent>, 9, False, +1.00, 2, 1, 0, 
      AutoLayout      =   MultiTapBtn, 10, <Parent>, 10, False, +1.00, 2, 1, 0, 
      AutoLayout      =   MultiTapBtn, 8, , 0, False, +1.00, 1, 1, 30, 
      Caption         =   "OneOrTwoTapButton"
      Enabled         =   True
      Height          =   30.0
      Left            =   10
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   225
      Visible         =   True
      Width           =   300.0
   End
   Begin iOSLabel Result
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Result, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Result, 4, MultiTapBtn, 3, False, +1.00, 2, 1, -50, 
      AutoLayout      =   Result, 1, <Parent>, 1, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Result, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "<no taps yet>"
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   145
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 3, MultiTapBtn, 4, False, +1.00, 1, 1, 50, 
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      Enabled         =   True
      Height          =   30.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "The button responds to single and double taps"
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   305
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  iOSGestures.removeRecognizersIncludingSubViews( Me )
		  
		  if (tapHandlerForButton <> nil) then
		    tapHandlerForButton.RemoveRecognizer()
		    tapHandlerForButton = nil
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if (tapHandlerForButton = nil) then
		    Dim numTaps as integer = 2  ' for double tap
		    Dim numTouches as integer = 1 ' for one finger tap
		    Dim gestureName as text = "the Button"
		    tapHandlerForButton = new iOSGestures.tapGesture( MultiTapBtn.Handle,  AddressOf tapHandler, numTaps, numTouches, gestureName )
		  end if
		  
		  'Dim bButtonIsSubView as Boolean = iOSGestures.UIKit.isDescendantOfView( MultiTapBtn.Handle, iOSGestures.UIViewPtrFromView(self) )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub tapHandler(recognizer as iosGestures.tapGesture, pos as xojo.Core.Point, eventInfo as iosGestures.gestureEventInfo)
		  #pragma unused recognizer
		  #pragma unused pos
		  #pragma unused eventInfo
		  
		  Dim sTapType as Text
		  
		  if (recognizer.NumberOfTapsRequired = 1) then
		    sTapType = "Single Tap! "
		  else
		    sTapType = "Double Tap! "
		  end if
		  
		  Result.Text = sTapType + " on " + recognizer.Name
		End Sub
	#tag EndMethod


	#tag Note, Name = Read Me
		
		This is an example of adding a gesture handler to an existing iOSControl instead of to an entire view.   The steps are no different than adding one to an iOSCanvas but this project demonstrates letting the OS do the work of handling the interaction between different user interaction.
		
		Here we put a single iOSButton control and a label ("Result") to hold some output on the View.
		In the Action event for the button we add Result.Text = "Single Tap!" to let us know when the button is responding to a single tap.
		
		We add a property ("tapHandlerForButton") to hold our tapGesture object and a method ("tapHandler") to receive our double tap events.
		
		For tapHandler, we copy and paste the parameter list from tapGesture's tapEventDelegate list (then remove the extra spaces that Xojo adds). and in its code we  set  ResultLabel.Text to "Double Tap!" to let us know when we receive a double-tap.
		
		Finally, we add an Open Event to the view where we create the tapGesture object, specify how many taps to watch for, add our tapHandler to respond to them, and finally attach it to our button.
		
		tapHandlerForButton = new iOSGestures.tapGesture()
		tapHandlerForButton.NumberOfTapsRequired = 2
		AddHandler tapHandlerForButton.Tap, AddressOf tapHandler
		tapHandlerForButton.Attach( Handle )
	#tag EndNote


	#tag Property, Flags = &h0
		tapHandlerForButton As iOSGestures.tapGesture
	#tag EndProperty


#tag EndWindowCode

#tag Events MultiTapBtn
	#tag Event
		Sub Action()
		  Result.Text = "Button's Action Event!"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
