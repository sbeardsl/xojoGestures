#tag Class
Protected Class gestureEventInfo
	#tag Method, Flags = &h0
		Sub Constructor(fTimeStamp as Double, touches() as xojo.core.Point)
		  m_fTimeOfEvent = fTimeStamp
		  m_PointerLocations = touches
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointerCount() As Integer
		  return m_PointerLocations.Ubound()+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointerPosition(nIndex as integer) As Xojo.Core.Point
		  Dim nPos as xojo.Core.Point
		  
		  if (nIndex < PointerCount()) then
		    nPos = m_PointerLocations(nIndex)
		  end if
		  
		  return nPos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeStamp() As Double
		  return m_fTimeOfEvent
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected m_fTimeOfEvent As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_PointerLocations() As Point
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_recognizerName As Text
	#tag EndProperty


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
End Class
#tag EndClass
