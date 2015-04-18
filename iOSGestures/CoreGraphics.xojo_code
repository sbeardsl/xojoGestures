#tag Module
Protected Module CoreGraphics
	#tag Structure, Name = CGPoint, Flags = &h1
		x as single
		y as single
	#tag EndStructure

	#tag Structure, Name = CGPoint32, Flags = &h1
		x as single
		y as single
	#tag EndStructure

	#tag Structure, Name = CGPoint64, Flags = &h1
		x as double
		y as double
	#tag EndStructure

	#tag Structure, Name = CGRect32, Flags = &h1
		location as CoreGraphics.CGPoint32
		rsize As CoreGraphics.CGSize32
	#tag EndStructure

	#tag Structure, Name = CGRect64, Flags = &h1
		location as CoreGraphics.CGPoint64
		rsize As CoreGraphics.CGSize64
	#tag EndStructure

	#tag Structure, Name = CGSize32, Flags = &h1
		width as single
		height as single
	#tag EndStructure

	#tag Structure, Name = CGSize64, Flags = &h1
		width as double
		height as double
	#tag EndStructure


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
