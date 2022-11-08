## 👋 Introduction

CleverTap provides in-app calls via its Signed Call iOS SDK, which means you can make and receive calls in any iOS app if the device has an internet connection and Signed Call iOS SDK. This section shows you how to set up and integrate the Signed Call iOS SDK and manage calls. 

To know more about the Signed Call feature, refer to [Signed Call](https://docs.clevertap.com/docs/signed-call).

Refer to [Signed Call Developer Documentation](https://developer.clevertap.com/docs/signed-call-ios-sdk) for detailed installation and integration steps.


## 🎉 Installation
### [CocoaPods](https://cocoapods.org)

```
source 'https://github.com/CleverTap/podspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

 target 'YOUR_TARGET_NAME' do  
      pod 'CleverTap-SignedCall-SDK'
  end 
```

## 🚀 Integration

Import CleverTap and Signed Call SDKs:

```
import CleverTapSDK
import SignedCallSDK
```

In your AppDelegate file, call the registerVoIP function to generate a VoIP token and set pushRegistryDelegate:

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CleverTap.setDebugLevel(CleverTapLogLevel.off.rawValue)
        CleverTap.autoIntegrate()
        SignedCall.isLoggingEnabled = true
        SignedCall.cleverTapInstance = CleverTap.sharedInstance()
        
        guard let rootView = self.window?.rootViewController else {
            return true
        }
        SignedCall.registerVoIP(withRootView: rootView)
        
        return true
    }
```

Initialize the Signed Call iOS SDK as follows:

```
SignedCall.initSDK(withInitOptions: initOptions) { result in
            switch result {
            case .success(let success):
                print("SDK Initialized! \(success)")
                //Handle success scenario
                
            case .failure(let error):
                print("SDK initialization failed \(error)")
                //Handle failure scenario
            }
        }
```

Use the following code to make a Signed Call:

```
let callOptions = SCCallOptionsModel(context: "contextString", cuid: "cuidString")

SignedCall.call(callOptions: callOptions) { result in
            switch result {
            case .success(let success):
                //Handle call initiated
                
            case .failure(let error):
                //Handle call failure
            }
        }   
```
