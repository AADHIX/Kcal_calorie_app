import 'package:flutter/services.dart';

class SignUpDataChannel {
  static const MethodChannel _channel = MethodChannel('signup_data_channel');

  static Future<void> submitNutrientsData(
      String username, String email, String password) async {
    try {
      await _channel.invokeMethod(
          'submitSignupData', {"username": username, "email": email, "password": password});
    } on PlatformException catch (e) {
      print("Failed to submit form data: '${e.message}'.");
    }
  }
}