#tag Module
Protected Module swipeDirection
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As UISwipeDirection
		  Declare Function getSwipeDirection Lib UIKitFramework selector "direction" (objRef As Ptr ) as UISwipeDirection
		  
		  Dim dir as UISwipeDirection
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "direction" )) then
		      dir = getSwipeDirection(objPtr)
		    end if
		  end if
		  
		  return dir
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, direction as UISwipeDirection, sourceMethodName as Text)
		  Declare Sub setSwipeDirection Lib UIKitFramework selector "setDirection:" (objRef As Ptr, direction As UISwipeDirection)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setDirection:", sourceMethodName)) then
		      setSwipeDirection( objPtr, direction)
		      
		      // now make sure that worked as expected
		      UIKit.swipeDirection.test( objPtr, direction, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, directionExpected as UISwipeDirection, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim actualDirection as UISwipeDirection = UIKit.swipeDirection.get( objPtr )
		    debug.ASSERT(directionExpected = actualDirection, CurrentMethodName + ": directionExpected <> recognizer.swipeDirection", sourceMethodName )
		  end if
		  
		End Sub
	#tag EndMethod


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
