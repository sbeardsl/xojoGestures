#tag Module
Protected Module numberOfTouchesRequired
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As Integer
		  Declare Function getNumberOfTouchesRequired lib UIKitFramework selector "numberOfTouchesRequired" (objRef as ptr) as integer
		  
		  Dim nTouches as integer
		  
		  if (objPtr<> nil) then
		    if (Foundation.objRespondsTo(objPtr, "numberOfTouchesRequired" )) then
		      nTouches = getNumberOfTouchesRequired(objPtr)
		    end if
		  end if
		  
		  return nTouches
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, nTouches as integer, sourceMethodName as Text)
		  Declare Sub setNumberOfTouchesRequired Lib UIKitFramework selector "setNumberOfTouchesRequired:" (objRef As Ptr, value As integer)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setNumberOfTouchesRequired:", sourceMethodName)) then
		      setNumberOfTouchesRequired( objPtr, nTouches)
		      
		      // now make sure that worked as expected
		      UIKit.numberOfTouchesRequired.test( objPtr, nTouches, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, nTouchesExpected as integer, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim nActualTouches as integer = UIKit.numberOfTouchesRequired.get( objPtr )
		    debug.ASSERT(nTouchesExpected = nActualTouches, CurrentMethodName + ":  nTouchesExpected <> recognizer.numberOfTouchesRequired", sourceMethodName )
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
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
