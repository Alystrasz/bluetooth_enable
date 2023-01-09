import Flutter
import UIKit
import CoreBluetooth
// https://stackoverflow.com/questions/39450534/cbcentralmanager-ios10-and-ios9/39498464#39498464


public class SwiftBluetoothEnablePlugin: NSObject, FlutterPlugin, CBCentralManagerDelegate {
    var centralManager: CBCentralManager!
    var lastKnownState = ""
    var flutterResult: FlutterResult!
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        lastKnownState = _getStateString(state: central);
        //print("central.state is " +
        if (lastKnownState == ".poweredOn"){
            flutterResult("true")
        } else {
            flutterResult("false")
        }
    }
    
    private func _getStateString(state: CBCentralManager) -> String {
        if #available(iOS 10.0, *) {
            switch state.state{
              case CBManagerState.unauthorized:
                  print("This app is not authorised to use Bluetooth low energy")
                return ".unauthorized";
              case CBManagerState.poweredOff:
                  print("Bluetooth is currently powered off.")
                return ".poweredOff";
              case CBManagerState.poweredOn:
                  print("Bluetooth is currently powered on and available to use.")
                return ".poweredOn";
            default:
                return "";
              }
          } else {
              // Fallback on earlier versions
              switch state.state.rawValue {
              case 3: // CBCentralManagerState.unauthorized :
                  print("This app is not authorised to use Bluetooth low energy")
                  return ".unauthorized";
              case 4: // CBCentralManagerState.poweredOff:
                  print("Bluetooth is currently powered off.")
                  return ".poweredOff";
              case 5: //CBCentralManagerState.poweredOn:
                  print("Bluetooth is currently powered on and available to use.")
                  return ".poweredOn";
              default:
                  return "";
              }
          }
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bluetooth_enable", binaryMessenger: registrar.messenger())
    let instance = SwiftBluetoothEnablePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch (call.method) {
      case "enableBluetooth":
          if (lastKnownState == ".poweredOn") {
              result("true")
          } else {
              centralManager = CBCentralManager(delegate: self, queue: nil)
          }
          break;
      default:
          print("Unsupported method: " + call.method)
          break;
      }
      
      flutterResult = result;
  }
}
