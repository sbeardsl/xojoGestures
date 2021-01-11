#tag Module
Protected Module enabled
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As Boolean
		  Declare Function getIsEnabled lib UIKitFramework selector "isEnabled" (objRef as ptr) as Boolean
		  
		  Dim bIsEnabled as Boolean
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "isEnabled" )) then
		      bIsEnabled = getIsEnabled(objPtr)
		    end if
		  end if
		  
		  return bIsEnabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, bShouldBeEnabled as boolean, sourceMethodName as Text)
		  Declare Sub setEnabled Lib UIKitFramework selector "setEnabled:" (objRef As Ptr, value As Boolean)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setEnabled:", sourceMethodName)) then
		      setEnabled( objPtr, bShouldBeEnabled)
		      
		      // now make sure that worked as expected
		      UIKit.enabled.test( objPtr, bShouldBeEnabled, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, bShouldBeEnabled as boolean, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim bIsEnabled as Boolean = UIKit.enabled.get( objPtr )
		    debug.ASSERT(bShouldBeEnabled = bIsEnabled, CurrentMethodName + ":  bIsEnabled <> recognizer.isEnabled", sourceMethodName )
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
