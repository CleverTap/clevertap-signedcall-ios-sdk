# Clevertap DirectCall iOS SDK

Enables 1-1 VOIP calls on iOS devices and simulators

## Usage

```
import CleverTapSDK
import DirectCallSDK

...

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    NotificationCenter.default.addObserver(self, selector: #selector(self.callStatus(notification:)), name: NSNotification.Name(rawValue: "MessageReceived"), object: nil)
    makeCallButton.isEnabled = false
     
    CleverTap.autoIntegrate()
        
    DirectCall.isLoggingEnabled = true
        
    DirectCall.registerVoIP(withRootView: (self), appName: "SampleApp") { [weak self] result in
          switch result {
          case .success(_):
              let initOptions: [String: Any] = [
                  "accountID": "<CleverTap Account ID>",
                  "apikey": "<CleverTap Account Token>",
                  "production": <true/false>,
                  "cuid" : "<unique user identifier>"
              ]
                
              DispatchQueue.global(qos: .userInitiated).async {
                  DirectCall.initSDK(withInitOptions: initOptions, ctInstance: CleverTap.sharedInstance()) { result in
                    switch result {
                    case .success(let success):
                        print("SDK Initialized! \(success)")
                        self?.isDCSDKInitialized = success
                            
                    case .failure(let error):
                        print("SDK initialization failed \(error)")
                    }
                }
          }
          case .failure(let error):
              print("VoIP registration is failed! \(error)")
          }
       }
   }

    @IBAction func makeCall(_ sender: Any) {
        let callOptions: [String: Any] = [
            "recording": false
        ]
        DirectCall.call(withCallee: cuid, withContext: context, withCallOptions: callOptions) { result in
            switch result {
            case .success(let value): print(value)
            case .failure(let error): print(error)
            }
        }
    }
```

## Install

### [CocoaPods](https://cocoapods.org)

```
 target 'YOUR_TARGET_NAME' do  
      pod 'CleverTap-DirectCall-iOS-SDK'  
  end 
```

### Manual

Download the `DirectCallSDK.xcframework.zip` included in this repository, unzip, drag it into your project and add it as an embedded framework in your build settings

