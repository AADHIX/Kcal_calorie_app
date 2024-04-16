import 'package:flutter/services.dart';

class ScanFoodChannel {
  // image channel
  static const MethodChannel _channel = MethodChannel('scan_food_channel');

  static Future<void> submitScanFoodData(
      String weight, String name, Uint8List? bitmap) async {
    try {
      await _channel.invokeMethod(
          'submitScanFoodData', {"weight": weight, "name": name, "path": bitmap});
    } on PlatformException catch (e) {
      print("Failed to submit form data: '${e.message}'.");
    }
  }
}