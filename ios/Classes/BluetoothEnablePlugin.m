#import "BluetoothEnablePlugin.h"
#if __has_include(<bluetooth_enable/bluetooth_enable-Swift.h>)
#import <bluetooth_enable/bluetooth_enable-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bluetooth_enable-Swift.h"
#endif

@implementation BluetoothEnablePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBluetoothEnablePlugin registerWithRegistrar:registrar];
}
@end
