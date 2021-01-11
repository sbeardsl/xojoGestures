#tag Module
Protected Module minimumPressDuration
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As Double
		  Declare Function getMinDuration Lib UIKitFramework selector "minimumPressDuration" (objRef As Ptr ) as Double
		  
		  Dim fMinimumPressDuration as integer
		  
		  if (objPtr<> nil) then
		    if (Foundation.objRespondsTo(objPtr, "minimumPressDuration" )) then
		      fMinimumPressDuration = getMinDuration(objPtr)
		    end if
		  end if
		  
		  return fMinimumPressDuration
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, minimumPressDuration as double, sourceMethodName as Text)
		  Declare Sub setMinDuration Lib UIKitFramework selector "setMinimumPressDuration:" (objRef As Ptr, duration as Double )
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setMinimumPressDuration:", sourceMethodName)) then
		      setMinDuration( objPtr, minimumPressDuration)
		      
		      // now make sure that worked as expected
		      UIKit.minimumPressDuration.Test( objPtr, minimumPressDuration, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, minimumPressDuration as integer, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim fActualminimumPressDuration as Double = UIKit.minimumPressDuration.get( objPtr )
		    debug.ASSERT(minimumPressDuration = fActualminimumPressDuration, CurrentMethodName + ": minimumPressDuration <> recognizer.minimumPressDuration", sourceMethodName )
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
