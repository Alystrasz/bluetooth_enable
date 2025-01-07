import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bluetooth_enable_platform_interface.dart';

/// An implementation of [BluetoothEnablePlatform] that uses method channels.
class MethodChannelBluetoothEnable extends BluetoothEnablePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bluetooth_enable');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
