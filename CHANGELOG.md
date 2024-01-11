# Change Log
All notable changes to this project will be documented in this file.

### [Version 0.0.6] (January 11, 2024)
### Adds
 * Supports [CleverTap iOS SDK v5.2.2](https://github.com/CleverTap/clevertap-ios-sdk/blob/master/CHANGELOG.md#version-522-november-21-2023).
 * Adds new NSNotification.Name `SCCallStatusDidUpdate` to observe the changes in the call state, providing updates to both the initiator and receiver of the call.

 #### Breaking Changes
 * The `MessageReceived` NSNotification observer is no longer supported. Please use the new NSNotification.Name `SCCallStatusDidUpdate`.

 #### Behaviour Changes
 * Handles UX issues during network loss or switch by invalidating the socket reconnection and establishing an active connection to process the call related actions.

 #### Bug Fixes
 * Addresses an infinite **Connecting** state issue on the call screen which was triggered by using CUIDs longer than 15 characters. In this version, the SDK extends support to CUIDs ranging from 5 to 50 characters.
 
### [Version 0.0.5] (Aug 23, 2023)
##### 
* Supports [CleverTap iOS SDK v5.2.0](https://github.com/CleverTap/clevertap-ios-sdk/releases/tag/5.2.0).
* Adds support for hiding the **Powered by Signed Call** label from VoIP call screens.

### [Version 0.0.4] (July 21, 2023)
##### 
- Adds public property `rootViewController`

### [Version 0.0.3](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.3) (June 22, 2022)
- Compatible with CleverTap iOS SDK v5.0.0 and later versions

### [Version 0.0.2](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.2) (February 21, 2022)
- Compatible with CleverTap iOS SDK v4.2.0 and later versions
- Compatible with CTSoftPhone v0.0.6-alpha and later version
- Adds public API disconnectSignallingSocket() to close the Signalling socket connection
- Adds support for Objective-C

### [Version 0.0.1](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.1) (November 8, 2022)
- Supports One-on-One Audio Calling
- Compatible with CleverTap iOS SDK v4.1.0 and later versions

### [Version 0.0.4-alpha](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.4-alpha) (March 20, 2022)
- Adds suupport for arm64 simulators

### [Version 0.0.3-alpha](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.3-alpha) (March 12, 2022)

### [Version 0.0.2-alpha](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.2-alpha) (March 10, 2022)

### [Version 0.0.1-alpha](https://github.com/CleverTap/clevertap-signedcall-ios-sdk/releases/tag/0.0.1-alpha) (March 9, 2022)


