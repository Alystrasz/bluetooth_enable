import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bluetooth_enable_method_channel.dart';

abstract class BluetoothEnablePlatform extends PlatformInterface {
  /// Constructs a BluetoothEnablePlatform.
  BluetoothEnablePlatform() : super(token: _token);

  static final Object _token = Object();

  static BluetoothEnablePlatform _instance = MethodChannelBluetoothEnable();

  /// The default instance of [BluetoothEnablePlatform] to use.
  ///
  /// Defaults to [MethodChannelBluetoothEnable].
  static BluetoothEnablePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BluetoothEnablePlatform] when
  /// they register themselves.
  static set instance(BluetoothEnablePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
