#tag Module
Protected Module maxNumberOfTouches
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As Integer
		  Declare Function getMaxNumberOfTouches lib "UIKit.Framework" selector "maximumNumberOfTouches" (objRef as ptr) as integer
		  
		  Dim nMaxTouches as integer
		  
		  if (objPtr<> nil) then
		    if (Foundation.objRespondsTo(objPtr, "maximumNumberOfTouches" )) then
		      nMaxTouches = getMaxNumberOfTouches(objPtr)
		    end if
		  end if
		  
		  return nMaxTouches
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, nMaxTouches as integer, sourceMethodName as Text)
		  Declare Sub setMaxNumberOfTouches Lib "UIKit.Framework" selector "setMaximumNumberOfTouches:" (objRef As Ptr, value As integer)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setMaximumNumberOfTouches:", sourceMethodName)) then
		      setMaxNumberOfTouches( objPtr, nMaxTouches)
		      
		      // now make sure that worked as expected
		      UIKit.maxNumberOfTouches.test( objPtr, nMaxTouches, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, nMaxTouchesExpected as integer, sourceMethodName as Text)
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim nActualMaxTouches as integer = UIKit.maxNumberOfTouches.get( objPtr )
		    debug.ASSERT(nMaxTouchesExpected = nActualMaxTouches, CurrentMethodName + ":  nMaxTouchesExpected <> recognizer.maximumNumberOfTouches", sourceMethodName )
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
