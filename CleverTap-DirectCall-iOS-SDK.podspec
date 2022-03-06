Pod::Spec.new do |s|
s.name                      = "CleverTap-DirectCall-iOS-SDK"
version                     = `cat sdk-version.txt`
s.version                   = version
s.summary                   = "CleverTap-DirectCall-iOS-SDK supports 1-1 voice calls"
s.homepage                  = "https://github.com/CleverTap/clevertap-directcall-ios-sdk"
s.source                    = { :http => "https://github.com/CleverTap/clevertap-directcall-ios-sdk/releases/download/#{s.version}/DirectCallSDK.xcframework.zip" }
s.license                   = { :type => 'Commercial', :text => 'TODO' }
s.author                    = { "CleverTap" => "http://www.clevertap.com" }
s.module_name               = 'DirectCallSDK'

s.platform                  = :ios, '10.0'
s.ios.deployment_target     = '10.0'
s.pod_target_xcconfig       = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
s.user_target_xcconfig      = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}

s.swift_version             = "5.0"

s.ios.frameworks            = 'Foundation', 'UIKit', 'Security', 'CoreGraphics', 'CoreImage', 'CoreFoundation', 'AVFoundation', 'AudioToolbox', 'VideoToolbox'

s.vendored_frameworks       = 'DirectCallSDK.xcframework'

s.ios.dependency            'Socket.IO-Client-Swift', '~> 15.2.0'

# TODO add CleverTapSDK dependency
end
