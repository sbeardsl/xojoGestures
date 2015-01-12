#tag Module
Protected Module view
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
		Protected Function get(objPtr as Ptr) As Ptr
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
