import 'package:flutter/material.dart';
import 'package:bluetooth_enable/bluetooth_enable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: _MyAppState(),
    );
  }
}

class _MyAppState extends StatelessWidget {
  Future<void> enableBT() async {
    BluetoothEnable.enableBluetooth.then((value) {
      print(value);
    });
  }

  Future<void> customEnableBT(BuildContext context) async {
    String dialogTitle = "Hey! Please give me permission to use Bluetooth!";
    bool displayDialogContent = true;
    String dialogContent = "This app requires Bluetooth to connect to device.";
    //or
    // bool displayDialogContent = false;
    // String dialogContent = "";
    String cancelBtnText = "Nope";
    String acceptBtnText = "Sure";
    double dialogRadius = 10.0;
    bool barrierDismissible = true; //

    BluetoothEnable.customBluetoothRequest(
            context,
            dialogTitle,
            displayDialogContent,
            dialogContent,
            cancelBtnText,
            acceptBtnText,
            dialogRadius,
            barrierDismissible)
        .then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bluetooth Enable Plugin',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Press the button to request turning on Bluetooth"),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: (() {
                  enableBT();
                }),
                child: Text('Request to turn on Bluetooth'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: (() {
                  customEnableBT(context);
                }),
                child: Text('Custom request to turn on Bluetooth'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
