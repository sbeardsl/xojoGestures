#tag Module
Protected Module CoreGraphics
	#tag Structure, Name = CGPoint, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		x as CGFloat
		y as CGFloat
	#tag EndStructure

	#tag Structure, Name = CGRect, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		location as CoreGraphics.CGPoint
		rsize As CoreGraphics.CGSize
	#tag EndStructure

	#tag Structure, Name = CGSize, Flags = &h1, Attributes = \"StructureAlignment \x3D 1"
		width as CGFloat
		height as CGFloat
	#tag EndStructure


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
