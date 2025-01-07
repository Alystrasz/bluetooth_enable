import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BluetoothEnable {
  static const MethodChannel _channel = const MethodChannel('bluetooth_enable');

  /// Main method of this package.
  ///
  /// This will check if Bluetooth is enabled on the smartphone; if it's not the
  /// case, it will ask for its activation.
  ///
  /// This is done differently regarding the hosting platform:
  ///     * on Android, an intent will be fired, displaying the user a dialog to
  ///     activate Bluetooth; the method will return once user clicked a dialog
  ///     option button.
  ///     * on iOS, a dialog will be displayed asking user to activate Bluetooth
  ///     in the application settings; the method will immediately return false,
  ///     and needs to be called a second time (after user supposedly activated
  ///     Bluetooth).
  static Future<String> get enableBluetooth async {
    final String bluetoothState =
        await _channel.invokeMethod('enableBluetooth');
    return bluetoothState;
  }

  /// This method activates Bluetooth just like enableBluetooth, but allows you
  /// to customize the request dialog.
  static Future<String> customBluetoothRequest(
      BuildContext context,
      String dialogTitle,
      bool displayDialogContent,
      String dialogContent,
      String cancelBtnText,
      String acceptBtnText,
      double dialogRadius,
      bool barrierDismissible) async {
    String dialogRet = await showAlertDialog(
        context,
        dialogTitle,
        displayDialogContent,
        dialogContent,
        cancelBtnText,
        acceptBtnText,
        dialogRadius,
        barrierDismissible);
    return dialogRet;
  }

  /// This displays a customized dialog to ask for Bluetooth activation.
  static Future<String> showAlertDialog(
      BuildContext context,
      String dialogTitle,
      bool displayDialogContent,
      String dialogContent,
      String cancelBtnText,
      String acceptBtnText,
      double dialogRadius,
      bool barrierDismissible) async {
    return await showDialog<String>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(dialogRadius))),
          title: Text(dialogTitle),
          content: (displayDialogContent)
              ? SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(dialogContent),
                    ],
                  ),
                )
              : null,
          actions: <Widget>[
            TextButton(
              child: Text(cancelBtnText),
              onPressed: () {
                Navigator.of(context).pop("false");
              },
            ),
            TextButton(
              child: Text(acceptBtnText),
              onPressed: () async {
                String bluetoothState =
                    await _channel.invokeMethod('customEnable');
                Navigator.of(context).pop(bluetoothState);
              },
            ),
          ],
        );
      },
    ).then((value) {
      return value ?? "";
    });
  }
}
