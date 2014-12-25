#tag Module
Protected Module Debug
	#tag Method, Flags = &h1
		Protected Sub ASSERT(testPassed as Boolean, errorMsg as Text, sourceMethodName as Text)
		  if (not testPassed) then
		    ASSERT_FAILED( errorMsg, sourceMethodName )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ASSERT_FAILED(errorMsg as Text, sourceMethodName as Text)
		  errorMsg = "ASSERT - " + ErrorMsg
		  if (not sourceMethodName.Empty()) then
		    errorMsg = ErrorMsg + " from " + sourceMethodName
		  end if
		  
		  errorMsg = errorMsg + "@" + Date.Now().ToText(Locale.Current, Date.FormatStyles.None, Date.FormatStyles.Medium)
		  
		  System.DebugLog( errorMsg )
		  
		  #If DebugBuild
		    break
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ASSERT_FAILED_RESPONDS_TO(objPtr as Ptr, selector as Text)
		  ASSERT_FAILED( "Object of class: " + Foundation.objPtrToClassName(objPtr) + " doesn't respond to selector: " + selector, "" )
		  
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
