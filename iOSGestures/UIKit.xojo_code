#tag Module
Protected Module UIKit
	#tag Method, Flags = &h1
		Protected Sub addGestureRecognizer(viewObjPtr as Ptr, recognizerPtr as Ptr)
		  Declare Sub addGestureRecognizer lib "UIKit.Framework" selector "addGestureRecognizer:" (target_view_handle as Ptr, recognizer as Ptr)
		  
		  if (Foundation.objRespondsTo( viewObjPtr,"addGestureRecognizer:") ) then
		    addGestureRecognizer( viewObjPtr, recognizerPtr )
		  else
		    debug.ASSERT_FAILED_RESPONDS_TO( viewObjPtr, "addGestureRecognizer:" )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getLocationInView(objPtr as Ptr, referenceViewPtr as Ptr) As xojo.Core.Point
		  Declare Function getLocationInView lib "UIKit.Framework" selector "locationInView:" (objRef As Ptr, viewPtr as Ptr) As CoreGraphics.CGPoint
		  
		  Dim locationInView as xojo.Core.Point
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "locationInView:" )) then
		      Dim cgp as CoreGraphics.CGPoint
		      cgp = getLocationInView(objPtr,referenceViewPtr)
		      locationInView = new xojo.Core.Point( cgp.x, cgp.y )
		    end if
		  end if
		  
		  return locationInView
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getLocationOfTouchInView(objPtr as Ptr, nTouchIndex as Integer, referenceViewPtr as Ptr) As xojo.Core.Point
		  Declare Function getLocationOfTouchInView lib "UIKit.Framework" selector "locationOfTouch:inView:" (objRef As Ptr, nIndex as integer, viewPtr as Ptr) As CoreGraphics.CGPoint
		  
		  Dim locationOfTouchInView as xojo.Core.Point
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "locationOfTouch:inView:" )) then
		      Dim cgp as CoreGraphics.CGPoint
		      cgp = getLocationOfTouchInView(objPtr, nTouchIndex, referenceViewPtr)
		      locationOfTouchInView = new xojo.Core.Point( cgp.x, cgp.y )
		    end if
		  end if
		  
		  return locationOfTouchInView
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getNumberOfTouches(objPtr as Ptr) As Integer
		  Declare Function getNumberOfTouches lib "UIKit.Framework" selector "numberOfTouches" (objRef as ptr) as integer
		  
		  Dim nTouches as integer
		  
		  if (objPtr<> nil) then
		    if (Foundation.objRespondsTo(objPtr, "numberOfTouches" )) then
		      nTouches = getNumberOfTouches(objPtr)
		    end if
		  end if
		  
		  return nTouches
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getRecognizerState(recognizer as Ptr) As UIKit.UIGestureRecognizerState
		  declare function getRecognizerState lib "UIKit.Framework" selector "state" (objRef as ptr) as UIKit.UIGestureRecognizerState
		  
		  Dim recState as UIKit.UIGestureRecognizerState = UIKit.UIGestureRecognizerState.UIGestureRecognizerStateUnkown
		  
		  Dim bSupportState as Boolean = Foundation.objRespondsTo( recognizer, "state" )
		  
		  if bSupportState then
		    recState = getRecognizerState( recognizer )
		  end if
		  
		  return recState
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getRotation(objPtr as Ptr) As Single
		  Declare Function getScale Lib "UIKit.Framework" selector "rotation" (objRef As Ptr ) as Single
		  
		  Dim scale as Single
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "rotation" )) then
		      scale = getScale(objPtr)
		    end if
		  end if
		  
		  return scale
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getScale(objPtr as Ptr) As Single
		  Declare Function getScale Lib "UIKit.Framework" selector "scale" (objRef As Ptr ) as Single
		  
		  Dim scale as Single
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "scale" )) then
		      scale = getScale(objPtr)
		    end if
		  end if
		  
		  return scale
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getTranslationInView(objPtr as Ptr, referenceViewPtr as Ptr) As xojo.Core.Point
		  Declare Function getTranslationInView Lib "UIKit.Framework" selector "translationInView:" (objRef As Ptr, referenceView as Ptr ) as CoreGraphics.CGPoint
		  
		  Dim translationInView as xojo.Core.Point
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "translationInView:" )) then
		      Dim cgp as CoreGraphics.CGPoint
		      cgp = getTranslationInView(objPtr,referenceViewPtr)
		      translationInView = new xojo.Core.Point( cgp.x, cgp.y )
		    end if
		  end if
		  
		  return translationInView
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getVelocity(objPtr as Ptr) As Single
		  Declare Function getVelocity Lib "UIKit.Framework" selector "velocity" (objRef As Ptr ) as Single
		  
		  Dim velocity as Single
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "velocity" )) then
		      velocity = getVelocity(objPtr)
		    end if
		  end if
		  
		  return velocity
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getVelocityInView(objPtr as Ptr, referenceViewPtr as Ptr) As xojo.Core.Point
		  Declare Function getVelocitynInView Lib "UIKit.Framework" selector "velocityInView:" (objRef As Ptr, referenceView as Ptr ) as CoreGraphics.CGPoint
		  
		  Dim velocitynInView as xojo.Core.Point
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "velocityInView:" )) then
		      Dim cgp as CoreGraphics.CGPoint
		      cgp = getVelocitynInView(objPtr,referenceViewPtr)
		      velocitynInView = new xojo.Core.Point( cgp.x, cgp.y )
		    end if
		  end if
		  
		  return velocitynInView
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InitWithTargetAction(objPtr as Ptr, theDelegate as Ptr, theSelectorString as Text) As Ptr
		  Declare Function doInitWithTargetAction Lib "UIKit.Framework" selector "initWithTarget:action:" (obj as Ptr, targetDelegate as Ptr, delegateSelector as Ptr ) as Ptr
		  
		  Dim delegateMethodSelector as Ptr = Foundation.NSSelectorFromString(theSelectorString)
		  
		  objPtr = doInitWithTargetAction( objPtr, theDelegate, delegateMethodSelector )
		  
		  return objPtr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function isDescendantOfView(thisView as Ptr, theParentView as Ptr) As Boolean
		  Declare Function isDescendantOfView lib "UIKit.Framework" selector "isDescendantOfView:" (objRef as Ptr, parentView as Ptr) as Boolean
		  
		  Dim bIsDescendant as Boolean = false
		  
		  if (thisView <> nil) then
		    if (Foundation.objRespondsTo(thisView, "isDescendantOfView:" )) then
		      bIsDescendant = isDescendantOfView( thisView, theParentView )
		    end if
		  end if
		  
		  return bIsDescendant
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub removeGestureRecognizer(viewObjPtr as Ptr, recognizerPtr as Ptr)
		  Declare Sub removeGestureRecognizer lib "UIKit.Framework" selector "removeGestureRecognizer:" (target_view_handle as Ptr, recognizer as Ptr)
		  
		  if (Foundation.objRespondsTo( viewObjPtr,"removeGestureRecognizer:") ) then
		    removeGestureRecognizer( viewObjPtr, recognizerPtr )
		  else
		    debug.ASSERT_FAILED_RESPONDS_TO( viewObjPtr, "removeGestureRecognizer:" )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function view(objPtr as Ptr) As Ptr
		  Declare Function viewFromObjPtr lib "Foundation.Framework" selector "view" (objPtr as Ptr) as Ptr
		  
		  Dim pView as Ptr
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo( objPtr, "view" )) then
		      pView = viewFromObjPtr(objPtr)
		    else
		      debug.ASSERT_FAILED_RESPONDS_TO( objPtr, "view")
		    end if
		  end if
		  
		  return pView
		  
		End Function
	#tag EndMethod


	#tag Enum, Name = UIGestureRecognizerState, Flags = &h1
		UIGestureRecognizerStatePossible
		  UIGestureRecognizerStateBegan
		  UIGestureRecognizerStateChanged
		  UIGestureRecognizerStateEnded
		  UIGestureRecognizerStateCancelled
		  UIGestureRecognizerStateFailed
		  UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
		UIGestureRecognizerStateUnkown = 9999
	#tag EndEnum

	#tag Enum, Name = UIRectEdge, Type = Integer, Flags = &h1
		UIRectEdgeNone = 0
		  UIRectEdgeTop = 1
		  UIRectEdgeLeft = 2
		  UIRectEdgeBottom = 4
		  UIRectEdgeRight = 8
		UIRectEdgeAll = 15
	#tag EndEnum

	#tag Enum, Name = UISwipeDirection, Type = Integer, Flags = &h1
		UISwipeGestureRecognizerDirectionNone= 0
		  UISwipeGestureRecognizerDirectionRight = 1
		  UISwipeGestureRecognizerDirectionLeft  = 2
		  UISwipeGestureRecognizerDirectionUp = 4
		UISwipeGestureRecognizerDirectionDown = 8
	#tag EndEnum


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
