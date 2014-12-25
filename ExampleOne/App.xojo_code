#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Method, Flags = &h0
		Sub ClearEvents()
		  App.LatestEventPos = nil
		  App.LatestEventInfo = nil
		  App.LatestNumTaps = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawBorder(g as iOSGraphics)
		  g.SaveState
		  g.LineWidth = 2.0
		  g.DrawRect( 0, 0, g.Width-1, g.Height-1 )
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPress(g as iOSGraphics)
		  g.SaveState
		  
		  Dim thisRectSize as integer = 80
		  Dim halfSize as Integer = thisRectSize / 2
		  g.DrawOval( LatestEventPos.X - halfSize, LatestEventPos.Y - halfSize, thisRectSize, thisRectSize )
		  
		  DrawTouches( g )
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSwipeDown(g as iOSGraphics)
		  g.SaveState
		  
		  Dim x as Double = App.LatestEventPos.X
		  Dim y as Double = g.Height
		  
		  if (App.LatestEventInfo.PointerCount < 2) then
		    g.DrawLine( x, g.Height/2 , x, Y )
		    g.DrawLine( x, y, x-10, y-10 )
		    g.DrawLine( x, y, x+10, y-10 )
		  else
		    DrawSwipeTouches( g, x, y )
		  end if
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSwipeLeft(g as iOSGraphics)
		  g.SaveState
		  
		  Dim x as Double = 0
		  Dim y as Double = App.LatestEventPos.Y
		  
		  if (App.LatestEventInfo.PointerCount < 2) then
		    g.DrawLine( g.Width/2, y, x, Y )
		    g.DrawLine( 0, y, 10, y - 10)
		    g.DrawLine( 0, y, 10, y + 10)
		  else
		    DrawSwipeTouches( g, x, y )
		  end if
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSwipeRight(g as iOSGraphics)
		  g.SaveState
		  
		  Dim x as Double = g.Width
		  Dim y as Double = App.LatestEventPos.Y
		  
		  
		  if (App.LatestEventInfo.PointerCount < 2) then
		    g.DrawLine( g.Width/2, y, x, Y )
		    g.DrawLine( x, y, x-10, y - 10)
		    g.DrawLine( x, y, x-10, y + 10)
		  else
		    DrawSwipeTouches( g, x, y )
		  end if
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSwipeTouches(g as iOSGraphics, x as double, y as double)
		  g.SaveState
		  
		  if (LatestEventInfo.PointerCount > 1) then
		    for i as integer =  1 to LatestEventInfo.PointerCount
		      Dim thisPointer as integer = i - 1
		      Dim thisOvalSize as integer = 10
		      Dim halfSize as Integer = thisOvalSize / 2
		      g.DrawOval( LatestEventInfo.PointerPosition(thisPointer).X - halfSize, LatestEventInfo.PointerPosition(thisPointer).Y - halfSize, thisOvalSize, thisOvalSize )
		      g.DrawLine( LatestEventInfo.PointerPosition(thisPointer).X, LatestEventInfo.PointerPosition(thisPointer).Y, X, Y )
		    next
		  end if
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSwipeUp(g as iOSGraphics)
		  g.SaveState
		  
		  Dim x as Double = App.LatestEventPos.X
		  Dim y as Double = 0
		  
		  if (App.LatestEventInfo.PointerCount < 2) then
		    g.DrawLine( x, g.Height/2 , x, Y )
		    g.DrawLine( x, y, x-10, y+10 )
		    g.DrawLine( x, y, x+10, y+10 )
		  else
		    DrawSwipeTouches( g, x, y )
		  end if
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTap(g as iOSGraphics)
		  g.SaveState
		  
		  Dim tapRectSize as integer = 20
		  
		  for i as integer = LatestNumTaps DownTo 1
		    Dim thisRectSize as integer = tapRectSize * i
		    Dim halfSize as Integer = thisRectSize / 2
		    g.DrawRect( LatestEventPos.X - halfSize, LatestEventPos.Y - halfSize, thisRectSize, thisRectSize )
		  next
		  
		  DrawTouches( g )
		  
		  g.RestoreState
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTouches(g as iOSGraphics)
		  g.SaveState
		  
		  if (LatestEventInfo.PointerCount > 1) then
		    for i as integer =  1 to LatestEventInfo.PointerCount
		      Dim thisPointer as integer = i - 1
		      Dim thisOvalSize as integer = 20
		      Dim halfSize as Integer = thisOvalSize / 2
		      g.DrawOval( LatestEventInfo.PointerPosition(thisPointer).X - halfSize, LatestEventInfo.PointerPosition(thisPointer).Y - halfSize, thisOvalSize, thisOvalSize )
		      g.DrawLine( LatestEventInfo.PointerPosition(thisPointer).X, LatestEventInfo.PointerPosition(thisPointer).Y, LatestEventPos.X, LatestEventPos.Y )
		    next
		  end if
		  
		  g.RestoreState
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		LatestEventInfo As iOSGestures.gestureEventInfo
	#tag EndProperty

	#tag Property, Flags = &h0
		LatestEventPos As xojo.Core.Point
	#tag EndProperty

	#tag Property, Flags = &h0
		LatestNumTaps As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="LatestNumTaps"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
