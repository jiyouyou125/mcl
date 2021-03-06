(in-package :TRAPS)
; Generated from #P"macintosh-hd:hd3:CInterface Translator:Source Interfaces:CGSession.h"
; at Sunday July 2,2006 7:24:21 pm.
; 
;  *  CGSession.h
;  *  CoreGraphics
;  *
;  *  Copyright (c) 2003 Apple Computer, Inc. All rights reserved.
;  *
;  
; #ifndef __CGSESSION_H__
(defconstant $__CGSESSION_H__ 1)
; #define __CGSESSION_H__ 1

(require-interface "CoreGraphics/CGBase")

(require-interface "CoreFoundation/CoreFoundation")
; 
;  * Fetch the current session's dictionary
;  * Returns NULL if the caller is not within a GUI session, as when the caller is a UNIX daemon,
;  * or if a system is configured to not run a Quartz GUI (window server disabled)
;  

(deftrap-inline "_CGSessionCopyCurrentDictionary" 
   (
   )
   (:pointer :__CFDictionary)
() )
; 
;  * Predefined keys for the Session dictionaries
;  * Values are provided as CFSTR() macros rather than extern C data for PEF/CFM support.
;  * Constant values will remain unchanged in future releases for PEF/CFM compatibility.
;  *
;  * These keys are guaranteed by the system to be present in a session dictionary.
;  * Additional keys and values may be defined and added to the dictionary by
;  * other system components as needed.
;  
; #define kCGSessionUserIDKey		CFSTR("kCGSSessionUserIDKey")
;  value is a CFNumber encoding a uid_t for the session's current user. 
; #define kCGSessionUserNameKey		CFSTR("kCGSSessionUserNameKey")
;  value is a CFString encoding the session's short user name as set by loginwindow 
; #define kCGSessionConsoleSetKey		CFSTR("kCGSSessionConsoleSetKey")
;  value is a CFNumber encoding a 32 bit unsigned  integer value representing a set of hardware composing a console 
; #define kCGSessionOnConsoleKey		CFSTR("kCGSSessionOnConsoleKey")
;  value is a CFBoolean, kCFBooleanTrue if the session is on a console, otherwise kCFBooleanFalse 
; #define kCGSessionLoginDoneKey		CFSTR("kCGSessionLoginDoneKey")
;  value is a CFBoolean, kCFBooleanTrue if login operation has been done, otherwise kCFBooleanFalse 

; #endif /* __CGSESSION_H__ */


(provide-interface "CGSession")