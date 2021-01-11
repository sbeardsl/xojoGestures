#tag Module
Protected Module numberOfTapsRequired
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As Integer
		  Declare Function getNumberOfTapsRequired lib UIKitFramework selector "numberOfTapsRequired" (objRef as ptr) as integer
		  
		  Dim nTaps as integer
		  
		  if (objPtr<> nil) then
		    if (Foundation.objRespondsTo(objPtr, "numberOfTapsRequired" )) then
		      nTaps = getNumberOfTapsRequired(objPtr)
		    end if
		  end if
		  
		  return nTaps
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, nTapsRequired as integer, sourceMethodName as Text)
		  Declare Sub setNumberOfTapRequired Lib UIKitFramework selector "setNumberOfTapsRequired:" (objRef As Ptr, nTaps As integer)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setNumberOfTapsRequired:", sourceMethodName)) then
		      setNumberOfTapRequired( objPtr, nTapsRequired)
		      
		      // now make sure that worked as expected
		      UIKit.numberOfTapsRequired.test( objPtr, nTapsRequired, sourceMethodName )
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, nTapsExpected as integer, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim nActualTaps as integer = UIKit.numberOfTapsRequired.get( objPtr )
		    debug.ASSERT(nTapsExpected = nActualTaps, CurrentMethodName + ": nTapsExpected <> recognizer.numberOfTapsRequired", sourceMethodName )
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
