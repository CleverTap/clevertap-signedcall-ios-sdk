# Clevertap DirectCall iOS SDK

Enables 1-1 VOIP calls on iOS devices and simulators

## Usage

```
import CleverTapSDK
import DirectCallSDK

...

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

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        
    NotificationCenter.default.addObserver(self, selector: #selector(self.callStatus(notification:)), name: NSNotification.Name(rawValue: "MessageReceived"), object: nil)
}

func initializeDCSDK() {
    
    let initOptions: [String: Any] = [
        "accountID": "Account Id",
        "apikey": "Api key",
        "production": false,
        "cuid" : "cuid"
    ]
      
    DirectCall.initSDK(withInitOptions: initOptions) { [weak self] result in
        DispatchQueue.main.async {
            guard let self = self else { return }
            switch result {
            case .success(let success):
                print("SDK Initialized! \(success)")
                
            case .failure(let error):
                print("SDK initialization failed \(error)")
            }
        }
    }
}

@IBAction func makeCall(_ sender: Any) {
    guard DirectCall.isEnabled else {
        //Handle UI when SDK not initialised
        return
    }
    
    let callOptions = DCCallOptionsModel(context: context, receiverCuid: receiverCuid,customMetaData: nil)
    
    DirectCall.call(callOptions: callOptions) { [weak self] result in
        guard let self = self else { return }
        DispatchQueue.main.async {
            switch result {
            case .success(let value): 
                print(value)
            case .failure(let error):
                print(error)
            }
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

