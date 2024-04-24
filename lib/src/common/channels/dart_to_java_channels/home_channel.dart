import 'package:flutter/services.dart';

class HomeDataChannel {

  static const MethodChannel _channel = MethodChannel('home_data_channel');

  static Future<String?> getCurrentUser() async {
    try {
      final String? username = await _channel.invokeMethod(
          'getCurrentUser');
      return username;
    } on PlatformException catch (e) {
      print("Failed: '${e.message}'.");
      return null;
    }
  }
}