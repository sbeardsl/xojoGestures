#tag Module
Protected Module minNumberOfTouches
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As Integer
		  Declare Function getMinNumberOfTouchesRequired lib UIKitFramework selector "minimumNumberOfTouches" (objRef as ptr) as integer
		  
		  Dim nMinTouches as integer
		  
		  if (objPtr<> nil) then
		    if (Foundation.objRespondsTo(objPtr, "minimumNumberOfTouches" )) then
		      nMinTouches = getMinNumberOfTouchesRequired(objPtr)
		    end if
		  end if
		  
		  return nMinTouches
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, nMinTouches as integer, sourceMethodName as Text)
		  Declare Sub setMinNumberOfTouches Lib UIKitFramework selector "setMinimumNumberOfTouches:" (objRef As Ptr, value As integer)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setMinimumNumberOfTouches:", sourceMethodName)) then
		      setMinNumberOfTouches( objPtr, nMinTouches)
		      
		      // now make sure that worked as expected
		      UIKit.minNumberOfTouches.test( objPtr, nMinTouches, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, nMinTouchesExpected as integer, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim nActualMinTouches as integer = UIKit.minNumberOfTouches.get( objPtr )
		    debug.ASSERT(nMinTouchesExpected = nActualMinTouches, CurrentMethodName + ":  nMinTouchesExpected <> recognizer.minimumNumberOfTouches", sourceMethodName )
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
