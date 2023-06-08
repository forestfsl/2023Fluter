import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let controller: FlutterViewController = self.window?.rootViewController as! FlutterViewController
        
        let batterChannel = FlutterMethodChannel(name: "next.flutter.io/battery", binaryMessenger: controller.binaryMessenger)
        
        batterChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            // Handle battery messages.
            switch call.method {
            case "getBatteryLevel":
                let batteryLevel = self.getBatteryLevel()
                if(batteryLevel == -1){
                    result(FlutterError(code: "UNAVAILABLE", message: "电池电量不可用", details: nil))
                }else{
                    result(batteryLevel)
                }
               
            default:
                result(FlutterMethodNotImplemented)
            }
        })
        
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func getBatteryLevel() -> Int {
        let device : UIDevice = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if(device.batteryState == .unknown) {
            return -1
        }else{
            return (Int)(device.batteryLevel * 100)
        }
    }
}
