import 'package:flutter/services.dart';

class NutrientsDataChannel {
  // nutrients channel
  static const MethodChannel _channel = MethodChannel('nutrients_data_channel');

  static Future<void> submitNutrientsData(
      double protein, double fat, double carbs) async {
    try {
      await _channel.invokeMethod(
          'submitNutrientsData', {"protein": protein, "fat": fat, "carbs": carbs});
    } on PlatformException catch (e) {
      print("Failed to submit form data: '${e.message}'.");
    }
  }
}