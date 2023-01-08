import Flutter
import UIKit

public class SwiftBluetoothEnablePlugin: NSObject, FlutterPlugin {  public static func register(with registrar: FlutterPluginRegistrar) {
          
          let channel = FlutterMethodChannel(name: "bluetooth_enable", binaryMessenger: registrar.messenger())

          let instance = SwiftBluetoothEnablePlugin()

        public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
          
            switch (call.method) {
          
            case "enableBluetooth":
          
                print("Activating bluetooth...");
          
                break;

            default:

    
                print("Unsupported method: " + call.method)

          
                break;
            }
          result("iOS " + UIDevice.current.systemVersion)
        }   
      }
    