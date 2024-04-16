import 'package:flutter/services.dart';

class LoginDataChannel {
  // nutrients channel
  static const MethodChannel _channel = MethodChannel('login_data_channel');

  static Future<void> submitLoginData(
      String username, String password) async {
    try {
      await _channel.invokeMethod(
          'submitLoginData', {"username": username, "password": password});
    } on PlatformException catch (e) {
      print("Failed to submit form data: '${e.message}'.");
    }
  }
}