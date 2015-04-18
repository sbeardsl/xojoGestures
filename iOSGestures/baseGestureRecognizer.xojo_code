#tag Class
Protected Class baseGestureRecognizer
	#tag CompatibilityFlags = ( TargetIOS )
	#tag Method, Flags = &h21
		Private Sub AddRecognizerToDict(osRecognizerPtr as Ptr, ourGesture as iosGestures.baseGestureRecognizer)
		  if (m_dictOfRecognizers = nil) then
		    m_dictOfRecognizers = new Dictionary()
		  end if
		  
		  m_dictOfRecognizers.Value(osRecognizerPtr) = ourGesture
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Attach(theControl as iOSControl)
		  Attach( theControl.Handle )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Attach(theView as iOSView)
		  Attach( theView.Handle )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Attach(targetViewHandle as Ptr)
		  if (m_bAttached) then
		    RemoveRecognizer()
		  end if
		  
		  if (GetTheDelegate() = nil) then
		    SetTheDelegate( CreateDelegate() )
		  end if
		  
		  if (theRecognizer = nil) then
		    theRecognizer = CreateGestureRecognizer()
		  end if
		  
		  if (not Foundation.objRespondsTo( targetViewHandle, "addGestureRecognizer:" )) then
		    
		    if (Foundation.objRespondsTo( targetViewHandle, "view" )) then
		      targetViewHandle = UIKit.view( targetViewHandle )
		      
		      if (not Foundation.objRespondsTo( targetViewHandle, "addGestureRecognizer:" ))  then
		        targetViewHandle = nil
		      end if
		    end if
		  end if
		  
		  SetTheTargetViewHandle( targetViewHandle )
		  
		  if ( GetTheTargetViewHandle() <> nil) then
		    AddRecognizerToDict( theRecognizer, self )
		    m_bAttached = true
		    UIKit.addGestureRecognizer( GetTheTargetViewHandle(), theRecognizer)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theRecognizerType as Text)
		  ' the dictonary stores pairs of Key: Ptr (the UIGestureRecognizer) Value: xojo baseGestureRecognizer
		  if (m_dictOfRecognizers = nil) then
		    m_dictOfRecognizers = new Dictionary
		  end if
		  
		  if (m_delegateMethodSelector = nil) then
		    m_delegateMethodSelector = Foundation.NSSelectorFromString(kDelegateMethodName)
		  end if
		  
		  RecognizerType =  theRecognizerType
		  
		  SetTheDelegate( CreateDelegate() )
		  theRecognizer = CreateGestureRecognizer()
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateDelegate() As Ptr
		  Dim theDelegate as Ptr
		  
		  if (m_DelegateClassRef = nil) then
		    m_DelegateClassRef = CreateDelegateClassRef()
		  end if
		  
		  if (m_DelegateClassRef <> nil) then
		    theDelegate = Foundation.alloc(m_DelegateClassRef)
		  end if
		  
		  return theDelegate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateDelegateClassRef() As Ptr
		  if (m_DelegateClassRef = nil) then
		    
		    Dim nsObjectClassRef As ptr=Foundation.NSClassFromString("NSObject")
		    
		    m_DelegateClassRef = Foundation.objc_allocateClassPair( nsObjectClassRef, kDelegateClassName ) 'UniqueClassName())
		    Dim delegateCallback as Ptr = AddressOf handleGesture
		    Dim bAdded As Boolean = Foundation.class_addMethod(m_DelegateClassRef, kDelegateMethodName, delegateCallback, kDelegateMethodTypeSignature, CurrentMethodName)
		    if (bAdded) then
		      Foundation.objc_registerClassPair(m_DelegateClassRef)
		    end if
		    
		  end if
		  
		  return m_DelegateClassRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateGestureRecognizer() As Ptr
		  Dim recognizerClassName as Text = RecognizerType()
		  Dim UIGestureRecognizerClass as Ptr = Foundation.NSClassFromString(recognizerClassName)
		  Dim aUIGestureRecognizer as Ptr = Foundation.alloc(UIGestureRecognizerClass)
		  aUIGestureRecognizer = UIKit.InitWithTargetAction( aUIGestureRecognizer,  GetTheDelegate(), kDelegateMethodName )
		  
		  return aUIGestureRecognizer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CurrentEventInfo() As gestureEventInfo
		  Dim eventInfo as gestureEventInfo
		  
		  Dim locations() as xojo.Core.Point
		  
		  For nPointerNum as Integer = 1 to NumberOfTouches
		    Dim nIndex as integer = nPointerNum - 1
		    Dim location as xojo.Core.Point = LocationOfTouchInView( nIndex )
		    debug.ASSERT( location <> nil, "NumberOfTouches was " + NumberOfTouches.ToText() + " and asked for location of touch #" + nIndex.toText() + " but got NIL", CurrentMethodName )
		    if (location <> nil) then
		      locations.Append( location )
		    end if
		  next
		  
		  eventInfo = new gestureEventInfo( Date.Now.SecondsFrom1970(), locations )
		  
		  return eventInfo
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  RemoveRecognizer()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoGesture(recognizer as Ptr)
		  #pragma unused recognizer
		  
		  debug.ASSERT_FAILED( "We should never be calling into baseGestureRecognizer.DoGesture(), only into one of its sub-classes DoGesture shared methods", CurrentMethodName )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GestureType() As Text
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTheDelegate() As Ptr
		  if  (m_delegate = nil) then
		    m_delegate = CreateDelegate()
		  end if
		  
		  return m_delegate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTheTargetViewHandle() As Ptr
		  Return m_TargetViewHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub handleGesture(id as ptr, sel as ptr, recognizerDelegate as ptr)
		  #pragma unused id
		  #pragma unused sel
		  
		  Dim theGestureRecognizer as baseGestureRecognizer = m_dictOfRecognizers.Lookup( recognizerDelegate, nil )
		  
		  if (theGestureRecognizer <> nil) then
		    theGestureRecognizer.DoGesture( recognizerDelegate )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocationOfTouchInView(nTouchIndex as Integer) As xojo.Core.Point
		  Dim pLocation as xojo.Core.Point
		  
		  Debug.ASSERT( nTouchIndex < NumberOfTouches, "Asking for Touch with index >= NumberOfTouches", CurrentMethodName )
		  
		  if (nTouchIndex < NumberOfTouches) then
		    pLocation =  UIKit.getLocationOfTouchInView( theRecognizer, nTouchIndex, GetTheTargetViewHandle() )
		  end if
		  
		  return pLocation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumberOfTouches() As integer
		  return UIKit.getNumberOfTouches( theRecognizer )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Position() As xojo.Core.Point
		  return UIKit.getLocationInView( theRecognizer, GetTheTargetViewHandle())
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function recognizerByName(sName as Text) As baseGestureRecognizer
		  Dim theRecognizer as baseGestureRecognizer
		  
		  For Each thisRecognizerAsEntry As DictionaryEntry In m_dictOfRecognizers
		    
		    Dim thisRecognizer as iOSGestures.baseGestureRecognizer = thisRecognizerAsEntry.Value()
		    if (thisRecognizer.Name = sName) then
		      theRecognizer = thisRecognizer
		      Exit
		    end if
		  next
		  
		  return theRecognizer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RecognizerRespondsTo(selectorName as Text, sourceMethodName as Text) As Boolean
		  ' Make sure this recognizer is of the correct Class and that it will respond to this selector
		  
		  Dim bPassed as Boolean = false
		  
		  debug.ASSERT( theRecognizer <> nil, "Accessed a NIL recognizer Ptr", sourceMethodName )
		  
		  if (theRecognizer <> nil) then
		    bPassed = Foundation.TestObjRespondsTo( theRecognizer, selectorName, sourceMethodName)
		  end if
		  
		  return bPassed
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRecognizer()
		  if (m_bAttached) then
		    
		    RemoveRecognizerFromDict()
		    
		    Dim targetViewHandle as Ptr = GetTheTargetViewHandle()
		    Dim recognizer as Ptr = theRecognizer
		    UIKit.removeGestureRecognizer( targetViewHandle, recognizer )
		    
		    m_bAttached = false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveRecognizerFromDict()
		  if (m_dictOfRecognizers <> nil) then
		    if (m_dictOfRecognizers.HasKey(theRecognizer)) then
		      m_dictOfRecognizers.Remove(theRecognizer)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RemoveRecognizers(theUIViewPtr as Ptr)
		  Dim recognizersToRemove() as baseGestureRecognizer
		  
		  For Each thisRecognizerAsEntry As DictionaryEntry In m_dictOfRecognizers
		    Dim thisRecognizer as iOSGestures.baseGestureRecognizer = thisRecognizerAsEntry.Value()
		    if (thisRecognizer.m_TargetViewHandle = theUIViewPtr) then
		      recognizersToRemove.Append(thisRecognizer)
		    end if
		  next
		  
		  ' Don't change the contents of the Dictionary in the middle of the iterator
		  for Each thisRecognizer as baseGestureRecognizer In recognizersToRemove
		    thisRecognizer.RemoveRecognizer()
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RemoveRecognizersIncludingSubViews(theUIViewPtr as Ptr)
		  Dim recognizersToRemove() as baseGestureRecognizer
		  
		  For Each thisRecognizerAsEntry As DictionaryEntry In m_dictOfRecognizers
		    Dim thisRecognizer as iOSGestures.baseGestureRecognizer = thisRecognizerAsEntry.Value()
		    if (UIKit.isDescendantOfView( thisRecognizer.m_TargetViewHandle, theUIViewPtr)) then
		      recognizersToRemove.Append(thisRecognizer)
		    end if
		  next
		  
		  ' Don't change the contents of the Dictionary in the middle of the iterator
		  for Each thisRecognizer as baseGestureRecognizer In recognizersToRemove
		    thisRecognizer.RemoveRecognizer()
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetTheDelegate(theDelegate as Ptr)
		  m_delegate = theDelegate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetTheTargetViewHandle(theTargetViewHandle as Ptr)
		  m_TargetViewHandle = theTargetViewHandle
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if (RecognizerRespondsTo( "isEnabled", CurrentMethodName)) then
			    Dim bTestEnabled as Boolean = UIKit.enabled.get( theRecognizer )
			    if (bTestEnabled <> mEnabled) then
			      break
			    end if
			  end if
			  
			  return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if (RecognizerRespondsTo( "setEnabled:", CurrentMethodName)) then
			    UIKit.enabled.set( theRecognizer, value, CurrentMethodName )
			  end if
			  
			  mEnabled = value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGesture
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGesture = value
			End Set
		#tag EndSetter
		Gesture As Text
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGesture As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRecognizerType As Text = "NotInitalizedYet"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtheRecognizer As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_bAttached As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_delegate As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared m_DelegateClassRef As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared m_delegateMethodSelector As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared m_dictOfRecognizers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_RecognizerType As Text = "baseGestureRecognizer"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private m_TargetViewHandle As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			return mName
		#tag EndNote
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mName = value
			End Set
		#tag EndSetter
		Name As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRecognizerType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRecognizerType = value
			End Set
		#tag EndSetter
		RecognizerType As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtheRecognizer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtheRecognizer = value
			End Set
		#tag EndSetter
		theRecognizer As Ptr
	#tag EndComputedProperty


	#tag Constant, Name = kDelegateClassName, Type = Text, Dynamic = False, Default = \"iOSGestures-Delegate-Class", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDelegateMethodName, Type = Text, Dynamic = False, Default = \"handleGesture:", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kDelegateMethodTypeSignature, Type = Text, Dynamic = False, Default = \"v@:@", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Gesture"
			Group="Behavior"
			InitialValue="baseGesture"
			Type="Text"
		#tag EndViewProperty
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
			Name="RecognizerType"
			Group="Behavior"
			InitialValue="baseClass"
			Type="Text"
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
