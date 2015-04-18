#tag Module
Protected Module Foundation
	#tag Method, Flags = &h1
		Protected Function alloc(classPtr as Ptr) As Ptr
		  Declare Function alloc Lib FoundationFramework selector "alloc" (classRef As Ptr) As Ptr
		  
		  return alloc( classPtr )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function classRespondsTo(classPtr as Ptr, selector as Text) As Boolean
		  Declare Function instancesRespondToSelector lib FoundationFramework selector "instancesRespondToSelector:" (classRef as Ptr, Sel as Ptr) as Boolean
		  
		  Dim bResponds as Boolean = false
		  
		  if (classPtr <> nil) then
		    Dim selectorPtr as Ptr = NSSelectorFromString( selector )
		    if  (selectorPtr <> nil) then
		      bResponds = instancesRespondToSelector( classPtr, selectorPtr )
		    end if
		  end if
		  
		  return bResponds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function class_addMethod(classPtr as Ptr, selector as Text, implementationPtr as Ptr, types as Text, sourceMethodName as Text) As Boolean
		  Declare Function class_addMethod Lib FoundationFramework (cls as Ptr, name as Ptr, imp as Ptr, types as CString) As Boolean
		  
		  Dim selectorPtr as Ptr = Foundation.NSSelectorFromString( selector )
		  Dim typesAsCString as CString = types.ToCString(TextEncoding.ASCII)
		  Dim bAdded as Boolean = class_addMethod( classPtr, selectorPtr, implementationPtr, typesAsCString )
		  
		  debug.ASSERT( bAdded, CurrentMethodName + "-Failed to add method: " + selector + " to class: " + NSStringFromClass( classPtr ), sourceMethodName )
		  
		  return bAdded
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function isKindOfClass(objRef as Ptr, superClassName as Text) As Boolean
		  ' return TRUE if the objRef is an object of superClass or a sub-class of superClass
		  ' e.g. a pointer to a UIView isKindOfClass UIView
		  ' e.g. a pointer to a XojoiOSView isKindOfClass UIView
		  
		  Declare Function isKindOfClass lib FoundationFramework selector "isKindOfClass:" (objRef as Ptr, superClassObj as Ptr) as Boolean
		  
		  Dim superClassPtr as Ptr = NSClassFromString( superClassName )
		  
		  Dim bIsKindOf as Boolean = false
		  
		  if (objRef <> nil) and (superClassPtr <> nil) then
		    bIsKindOf = isKindOfClass( objRef, superClassPtr )
		  end if
		  
		  return bIsKindOf
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSClassFromString Lib FoundationFramework (classname as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSSelectorFromString Lib FoundationFramework (aSelectorName as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function NSStringFromClass Lib FoundationFramework (obj as Ptr) As CFStringRef
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function objc_allocateClassPair(superclass as Ptr, className as Text, optional extraBytes as integer = 0) As Ptr
		  Declare Function objc_allocateClassPair Lib FoundationFramework (superclass As Ptr, className As CString, extraBytes As Integer) As Ptr
		  
		  Dim classNameAsCString as CString =  className.ToCString(TextEncoding.ASCII())
		  
		  Dim classPairPtr as Ptr = objc_allocateClassPair( superclass, classNameAsCString, extraBytes )
		  
		  return classPairPtr
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Sub objc_registerClassPair Lib FoundationFramework (classPtr as Ptr)
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function objPtrToClassName(objRef as Ptr) As Text
		  Dim classPtr as Ptr = Foundation.objPtrToClassPtr( objRef )
		  Dim sClassName as Text = NSStringFromClass( classPtr )
		  
		  return sClassName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objPtrToClassPtr(objPtr as Ptr) As Ptr
		  Declare Function getClassPtrFromObjPtr lib FoundationFramework selector "class" (classRef as Ptr) as Ptr
		  
		  Dim classPtr as Ptr
		  
		  if (objPtr <> nil) then
		    classPtr =  getClassPtrFromObjPtr( objPtr )
		  end if
		  
		  return classPtr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function objRespondsTo(objPtr as Ptr, selector as Text) As boolean
		  Dim bResponds as Boolean = false
		  
		  Dim classPtr as Ptr = objPtrToClassPtr( objPtr )
		  if (classPtr <> nil) then
		    bResponds = classRespondsTo( classPtr, selector )
		  end if
		  
		  return bResponds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TestObjIsClass(objPtr as Ptr, expectedClassName as Text, sourceMethodName as Text) As Boolean
		  Dim objClassName as Text = Foundation.objPtrToClassName( objPtr )
		  Dim bTestPassed as Boolean = (objClassName = expectedClassName)
		  
		  debug.ASSERT( bTestPassed, CurrentMethodName + ": Expected obj of class[" + expectedClassName + "], received obj of class[" + objClassName + "] ", sourceMethodName )
		  
		  return bTestPassed
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TestObjRespondsTo(objPtr as Ptr, selectorString as Text, sourceMethodName as Text) As Boolean
		  Dim bTestPassed as Boolean = Foundation.objRespondsTo( objPtr, selectorString )
		  
		  debug.ASSERT( bTestPassed, CurrentMethodName + ": Obj of class[" + Foundation.objPtrToClassName(objPtr) + "], doesn't respond to selector[" + selectorString + "] ", sourceMethodName )
		  
		  return bTestPassed
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TestObjRespondsToSelector(objPtr as Ptr, selectorString as Text, sourceMethodName as Text) As Boolean
		  Dim bTestPassed as Boolean = Foundation.objRespondsTo( objPtr, selectorString )
		  
		  debug.ASSERT( bTestPassed, CurrentMethodName + ": Obj of class[" + Foundation.objPtrToClassName(objPtr) + "], doesn't respond to selector[" + selectorString + "] ", sourceMethodName )
		  
		  return bTestPassed
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function x_class_replaceMethod Lib FoundationFramework (cls as Ptr, name as Ptr, imp as Ptr, types as CString) As Ptr
	#tag EndExternalMethod


	#tag Constant, Name = FoundationFramework, Type = Text, Dynamic = False, Default = \"Foundation.Framework", Scope = Protected
	#tag EndConstant


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
