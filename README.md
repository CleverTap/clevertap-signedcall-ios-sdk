## 👋 Introduction

CleverTap provides in-app calls via its Direct Call iOS SDK, which means you can make and receive calls in any iOS app if the device has an internet connection and Direct Call iOS SDK. This section shows you how to set up and integrate the Direct Call iOS SDK and manage calls. 

To know more about the Direct Call feature, refer to [Direct Call](https://docs.clevertap.com/docs/direct-call).

Refer to [Direct Call Developer Documentation](https://developer.clevertap.com/docs/direct-call-ios-sdk) for detailed installation and integration steps.


## 🎉 Installation
### [CocoaPods](https://cocoapods.org)

```
source 'https://github.com/CleverTap/podspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

 target 'YOUR_TARGET_NAME' do  
      pod 'CleverTap-DirectCall-SDK'
  end 
```

## 🚀 Integration

Import CleverTap and Direct Call SDKs:

```
import CleverTapSDK
import DirectCallSDK
```

In your AppDelegate file, call the registerVoIP function to generate a VoIP token and set pushRegistryDelegate:

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CleverTap.setDebugLevel(CleverTapLogLevel.off.rawValue)
        CleverTap.autoIntegrate()
        DirectCall.isLoggingEnabled = true
        DirectCall.cleverTapInstance = CleverTap.sharedInstance()
        
        guard let rootView = self.window?.rootViewController else {
            return true
        }
        DirectCall.registerVoIP(withRootView: rootView)
        
        return true
    }
```

Initialize the Direct Call iOS SDK as follows:

```
DirectCall.initSDK(withInitOptions: initOptions) { result in
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

Use the following code to make a Direct Call:

```
let callOptions = DCCallOptionsModel(context: "contextString", cuid: "cuidString")

DirectCall.call(callOptions: callOptions) { result in
            switch result {
            case .success(let success):
                //Handle call initiated
                
            case .failure(let error):
                //Handle call failure
            }
        }   
```
