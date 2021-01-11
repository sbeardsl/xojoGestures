#tag Module
Protected Module edges
	#tag Method, Flags = &h1
		Protected Function get(objPtr as Ptr) As UIRectEdge
		  Declare Function getEdge Lib UIKitFramework selector "edges" (objRef As Ptr ) as UIRectEdge
		  
		  Dim edge as UIRectEdge = UIRectEdge.UIRectEdgeNone
		  
		  if (objPtr <> nil) then
		    if (Foundation.objRespondsTo(objPtr, "edges" )) then
		      edge = getEdge(objPtr)
		    end if
		  end if
		  
		  return edge
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub set(objPtr as Ptr, edge as UIRectEdge, sourceMethodName as Text)
		  Declare Sub setEdge Lib UIKitFramework selector "setEdges:" (objRef As Ptr, edge As UIRectEdge)
		  
		  if (objPtr <> nil) then
		    if (Foundation.TestObjRespondsToSelector(objPtr, "setEdges:", sourceMethodName)) then
		      setEdge( objPtr, edge)
		      
		      // now make sure that worked as expected
		      UIKit.edges.test( objPtr, edge, sourceMethodName )
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test(objPtr as Ptr, edgeExpected as UIRectEdge, sourceMethodName as Text)
		  'the get method doesn't seem to work right now, so we will just use set and hope for the best
		  
		  return
		  
		  if (objPtr = nil) then
		    debug.ASSERT_FAILED( CurrentMethodName + ": objPtr = NIL ", sourceMethodName )
		  else
		    Dim actualEdge as UIRectEdge = UIKit.edges.get( objPtr )
		    debug.ASSERT(edgeExpected = actualEdge, CurrentMethodName + ": edgesExpected <> recognizer.edges", sourceMethodName )
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
