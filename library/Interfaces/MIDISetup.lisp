(in-package :TRAPS)
; Generated from #P"macintosh-hd:hd3:CInterface Translator:Source Interfaces:MIDISetup.h"
; at Sunday July 2,2006 7:27:02 pm.
; 
;  	File:   	CoreMIDI/MIDISetup.h
;  
;  	Contains:   Specialized configuration-editing routines for CoreMIDI.
;  
;  	Version:	Technology: Mac OS X
;  				Release:	Mac OS X
;  
;  	Copyright:  (c) 2000-2001 by Apple Computer, Inc., all rights reserved.
;  
;  	Bugs?:  	For bug reports, consult the following page on
;  				the World Wide Web:
;  
;  					http://developer.apple.com/bugreporter/
;  
; 
; #ifndef __MIDISetup_h__
; #define __MIDISetup_h__
; #ifndef __MIDIServices_h__
#| #|
#include <CoreMIDIMIDIServices.h>
#endif
|#
 |#
;   -----------------------------------------------------------------------------
; !
; 	@header MIDISetup
; 
; 	This header defines functions that manipulate and customize the global
; 	state of the MIDI system.  These functions are generally only needed by 
; 	applications which wish to allow the user some flexibility in how
; 	the MIDI system's state is presented, and by MIDI drivers, which may
; 	dynamically modify the system state as hardware is connected and 
; 	disconnected.
; 
;   -----------------------------------------------------------------------------
; !
; 	@typedef		MIDISetupRef
; 	
; 	@discussion		Derives from MIDIObjectRef, does not have an owner object.
; 
; 					This represents the global state of the MIDI system,
; 					containing lists of the MIDI devices and serial port
; 					owners.
; 					
; 					Generally, only MIDI drivers and specialized configuration
; 					editors will need to manipulate MIDISetup objects, not the
; 					average MIDI client application.  As of CoreMIDI 1.1, the
; 					MIDIServer maintains a single global MIDISetupRef, stored
; 					persistently in a preference file.
; 

(def-mactype :MIDISetupRef (find-mactype '(:pointer :OpaqueMIDISetup)))
; #ifdef __cplusplus
#| #|
extern "C" {
#endif
|#
 |#
;  ______________________________________________________________________________
; 	MIDISetup
;  ______________________________________________________________________________
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupCreate
; 
; 	@abstract 		Interrogates drivers, to discover what hardware is present.
; 	
; 					As of CoreMIDI 1.1, it is usually not necessary to call
; 					this function, as CoreMIDI manages a single persistent
; 					MIDISetup itself.
; 
; 	@param			outSetup
; 						On successful return, points to a newly-created MIDISetup
; 						object.  The caller is responsible for disposing it,
; 						or transferring ownership of the object back to the
; 						system, with MIDISetupInstall.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDISetupCreate" 
   ((outSetup (:pointer :MIDISETUPREF))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupDispose
; 
; 	@abstract 		Dispose a MIDISetup object.
; 
; 					As of CoreMIDI 1.1, it is usually not necessary to call
; 					this function, as CoreMIDI manages a single persistent
; 					MIDISetup itself.
; 	
; 	@param			setup
; 						The MIDISetup to be disposed.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDISetupDispose" 
   ((setup (:pointer :OpaqueMIDISetup))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupInstall
; 
; 	@abstract 		Install a MIDISetup as the system's current state.
; 
; 					A client can create a MIDISetup object using
; 					MIDISetupCreate, or MIDISetupFromData.  This function will
; 					install this state as the current state of the system,
; 					possibly changing the devices visible to clients.
; 
; 					As of CoreMIDI 1.1, it is usually not necessary to call
; 					this function, as CoreMIDI manages a single persistent
; 					MIDISetup itself.
; 
; 	@param			setup
; 						The MIDISetup object to install.  Ownership of this
; 						object is transferred from the client to the system; the
; 						client must <b>not</b> dispose of this MIDISetup.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDISetupInstall" 
   ((setup (:pointer :OpaqueMIDISetup))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupGetCurrent
; 
; 	@abstract 		Return the system's current MIDISetup.
; 	
; 					As of CoreMIDI 1.1, it is usually not necessary to call
; 					this function, as CoreMIDI manages a single persistent
; 					MIDISetup itself.
; 	
; 	@param			outSetup
; 						On successful return, points to the system's most
; 						recently installed MIDISetup.  The system retains
; 						ownership of the object; the client must <b>not</b>
; 						dispose of this MIDISetup.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDISetupGetCurrent" 
   ((outSetup (:pointer :MIDISETUPREF))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupToData
; 
; 	@abstract 		Create an XML representation of a MIDISetup object.
; 	
; 					As of CoreMIDI 1.1, it is usually not necessary to call
; 					this function, as CoreMIDI manages a single persistent
; 					MIDISetup itself.
; 	
; 	@param			setup
; 						The MIDISetup object whose XML representation is to be
; 						returned.
; 	@param			outData
; 						On successful return, points to a newly-created CFDataRef
; 						containing the XML text.  The client is responsible for
; 						releasing this CFData object when done with it.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDISetupToData" 
   ((setup (:pointer :OpaqueMIDISetup))
    (outData (:pointer :CFDataRef))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupFromData
; 
; 	@abstract 		Create a MIDISetup object from an XML stream.
; 	
; 					As of CoreMIDI 1.1, it is usually not necessary to call
; 					this function, as CoreMIDI manages a single persistent
; 					MIDISetup itself.
; 	
; 	@param			data
; 						The XML text from which a MIDISetup object is to be built.
; 	@param			outSetup
; 						On successful return, points to a newly-created MIDISetup
; 						object.  The caller is responsible for disposing it, or
; 						transferring ownership of the object back to the system,
; 						with MIDISetupInstall.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDISetupFromData" 
   ((data (:pointer :__CFData))
    (outSetup (:pointer :MIDISETUPREF))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDIDeviceAddEntity
; 
; 	@discussion		Drivers call this function to specify one of the entities that 
; 					comprise a device.
; 					
; 					Non-drivers may call this function as of CoreMIDI 1.1, to
; 					add entities to external devices.
; 	
; 	@param			device
; 						The device to which an entity is to be added.
; 	@param			name
; 						The name of the new entity.
; 	@param			embedded
; 						True if this entity is inside the device, false if the
; 						entity simply consists of external connectors to which
; 						other devices can be attached.
; 	@param			numSourceEndpoints
; 						The number of source endpoints the entity has.
; 	@param			numDestinationEndpoints
; 						The number of destination endpoints the entity has.
; 	@param			newEntity
; 						On successful return, points to the newly-created entity.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDIDeviceAddEntity" 
   ((device (:pointer :OpaqueMIDIDevice))
    (name (:pointer :__CFString))
    (embedded :Boolean)
    (numSourceEndpoints :UInt32)
    (numDestinationEndpoints :UInt32)
    (newEntity (:pointer :MIDIENTITYREF))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDIDeviceRemoveEntity
; 
; 	@discussion		Drivers may call this function to remove one of a device's
; 					entities.
; 					
; 					New for CoreMIDI 1.1.
; 	
; 	@param			device
; 						The device from which an entity is to be removed.
; 	@param			entity
; 						The entity to be removed.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDIDeviceRemoveEntity" 
   ((device (:pointer :OpaqueMIDIDevice))
    (entity (:pointer :OpaqueMIDIEntity))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDIEntityAddOrRemoveEndpoints
; 
; 	@discussion		Drivers may call this function to add to or remove an
; 					entity's endpoints.
; 					
; 					New for CoreMIDI 1.3.
; 	
; 	@param			device
; 						The device from which an entity is to be removed.
; 	@param			entity
; 						The entity to be removed.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDIEntityAddOrRemoveEndpoints" 
   ((entity (:pointer :OpaqueMIDIEntity))
    (numSourceEndpoints :UInt32)
    (numDestinationEndpoints :UInt32)
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupAddDevice
; 
; 	@abstract 		Adds a driver-owner MIDI device to the current MIDISetup
; 	
; 	@discussion		Only MIDI drivers may make this call; it is in this header
; 					file only for consistency with MIDISetupRemoveDevice.
; 	
; 					New for CoreMIDI 1.1.
; 	
; 	@param			device
; 						The device to be added.
; 

(deftrap-inline "_MIDISetupAddDevice" 
   ((device (:pointer :OpaqueMIDIDevice))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupRemoveDevice
; 
; 	@abstract 		Removes a driver-owned MIDI device from the current MIDISetup
; 	
; 	@discussion		Generally this should only be called from a studio configuration
; 					editor, to remove a device which is offline and which the user
; 					has specified as being permanently missing.
; 					
; 					Instead of removing devices from the setup, drivers should
; 					set the device's kMIDIPropertyOffline to 1 so that if the
; 					device reappears later, none of its properties are lost.
; 	
; 					New for CoreMIDI 1.1.
; 	
; 	@param			device
; 						The device to be added.
; 

(deftrap-inline "_MIDISetupRemoveDevice" 
   ((device (:pointer :OpaqueMIDIDevice))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupAddExternalDevice
; 
; 	@abstract 		Adds an external MIDI device to the current MIDISetup
; 	
; 	@discussion		Useful for a studio configuration editor.  New for CoreMIDI 1.1.
; 	
; 	@param			device
; 						The device to be added.
; 

(deftrap-inline "_MIDISetupAddExternalDevice" 
   ((device (:pointer :OpaqueMIDIDevice))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetupRemoveExternalDevice
; 
; 	@abstract 		Removes an external MIDI device from the current MIDISetup
; 	
; 	@discussion		Useful for a studio configuration editor.  New for CoreMIDI 1.1.
; 	
; 	@param			device
; 						The device to be removed.
; 

(deftrap-inline "_MIDISetupRemoveExternalDevice" 
   ((device (:pointer :OpaqueMIDIDevice))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDIGetSerialPortOwner
; 
; 	@abstract 		Returns the MIDI driver that owns a serial port.
; 	
; 	@discussion		The current MIDISetup tracks ownership of serial ports
; 					to one of the MIDI drivers installed in the system.
; 	
; 					Serial ports can be enumerated using IOServiceMatching(
; 					kIOSerialBSDServiceValue).  The port's unique name is
; 					the IOService's kIOTTYDeviceKey property. 
; 
; 					New for CoreMIDI 1.1.
; 					
; 					A previous version of this documentation specified an incorrect
; 					key for obtaining the port's unique name (IOTTYBaseName).
; 	
; 	@param			portName
; 						The name of a serial port.
; 	@param			outDriverName
; 						On exit, the name of the driver owning the port,
; 						or NULL if no driver owns it.
; 
; 	@result			An OSStatus result code.	
; 

(deftrap-inline "_MIDIGetSerialPortOwner" 
   ((portName (:pointer :__CFString))
    (outDriverName (:pointer :CFStringRef))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDISetSerialPortOwner
; 
; 	@abstract 		Specifies the MIDI driver that owns a serial port.
; 	
; 	@discussion		Use this to assign ownership of a serial port
; 					to one of the MIDI drivers installed in the system.
; 	
; 					New for CoreMIDI 1.1.
; 	
; 	@param			portName
; 						The name of a serial port.
; 	@param			driverName
; 						The name of the driver that owns the serial port,
; 						or NULL to specify that no driver owns it.
; 
; 	@result			An OSStatus result code.	
; 

(deftrap-inline "_MIDISetSerialPortOwner" 
   ((portName (:pointer :__CFString))
    (driverName (:pointer :__CFString))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDIGetSerialPortDrivers
; 
; 	@abstract 		Returns a list of installed MIDI drivers for serial port
; 					MIDI devices.
; 	
; 	@discussion		Use this to determine which of the installed MIDI drivers
; 					are for devices which may attach to serial ports.
; 	
; 					New for CoreMIDI 1.1.
; 	
; 	@param			outDriverNames
; 						On exit, a CFArrayRef containing a list of CFStringRef's
; 						which are the names of the serial port MIDI drivers.
; 						The array should be released by the caller.
; 
; 	@result			An OSStatus result code.	
; 

(deftrap-inline "_MIDIGetSerialPortDrivers" 
   ((outDriverNames (:pointer :CFArrayRef))
   )
   :OSStatus
() )
;   -----------------------------------------------------------------------------
; !
; 	@function		MIDIExternalDeviceCreate
; 
; 	@abstract		Create a new external MIDI device.
; 
; 	@discussion		Non-drivers may call this function as of CoreMIDI 1.1, to
; 					create external devices.
; 
; 					The new device is not added to the current MIDISetupRef;
; 					to do this, use MIDISetupAddExternalDevice.
; 	
; 	@param			name
; 						The name of the new device.
; 	@param			manufacturer
; 						The name of the device's manufacturer.
; 	@param			model
; 						The device's model name.
; 	@param			outDevice
; 						On successful return, points to the newly-created device.
; 	@result			An OSStatus result code.
; 

(deftrap-inline "_MIDIExternalDeviceCreate" 
   ((name (:pointer :__CFString))
    (manufacturer (:pointer :__CFString))
    (model (:pointer :__CFString))
    (outDevice (:pointer :MIDIDEVICEREF))
   )
   :OSStatus
() )
; #ifdef __cplusplus
#| #|
}
#endif
|#
 |#

; #endif /* __MIDISetup_h__ */


(provide-interface "MIDISetup")