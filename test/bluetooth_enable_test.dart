import 'package:flutter_test/flutter_test.dart';
import 'package:bluetooth_enable/bluetooth_enable.dart';
import 'package:bluetooth_enable/bluetooth_enable_platform_interface.dart';
import 'package:bluetooth_enable/bluetooth_enable_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBluetoothEnablePlatform
    with MockPlatformInterfaceMixin
    implements BluetoothEnablePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BluetoothEnablePlatform initialPlatform = BluetoothEnablePlatform.instance;

  test('$MethodChannelBluetoothEnable is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBluetoothEnable>());
  });

  test('getPlatformVersion', () async {
    BluetoothEnable bluetoothEnablePlugin = BluetoothEnable();
    MockBluetoothEnablePlatform fakePlatform = MockBluetoothEnablePlatform();
    BluetoothEnablePlatform.instance = fakePlatform;

    expect(await bluetoothEnablePlugin.getPlatformVersion(), '42');
  });
}
