#tag Module
Protected Module gesturesUtilityMethod
	#tag Method, Flags = &h1
		Protected Function xclassPtrDescription(classPtr as Ptr) As Text
		  Declare Function classDescription lib "Foundation.Framework" selector "description" (classRef as Ptr) as CFStringRef
		  
		  return classDescription( classPtr )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function xTestObjIsClassAndRespondsToSelector(objPtr as Ptr, expectedClassName as Text, selectorString as Text, sourceMethodName as Text) As Boolean
		  Dim bClassTestPassed as Boolean = Foundation.TestObjIsClass( objPtr, expectedClassName, sourceMethodName )
		  Dim bSelectorTestPassed as Boolean = Foundation.TestObjRespondsToSelector( objPtr, selectorString, sourceMethodName )
		  
		  return (bClassTestPassed and bSelectorTestPassed)
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
