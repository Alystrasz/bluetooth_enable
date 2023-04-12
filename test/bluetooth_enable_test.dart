import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart';

void main() {
  const MethodChannel channel = MethodChannel('bluetooth_enable');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'true';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getEnableBluetoothResult', () async {
    expect(await BluetoothEnable.enableBluetooth, 'true');
  });
}
