import 'package:calory/src/common_widgets/nutrients_cell.dart';
import 'package:calory/src/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants/colors.dart';

class AddNutrients extends StatefulWidget {
  const AddNutrients({super.key});

  @override
  State<AddNutrients> createState() => _AddNutrientsState();
}

class _AddNutrientsState extends State<AddNutrients> {

  String proteinS = '';
  String carbsS = '';
  String fatS = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Text(
          "Add Nutrients",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/images/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: NutrientsCell(
                    icon: proteinIcon,
                    title: "Protein",
                    onChanged: (value) {
                      setState(() {
                        proteinS = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: NutrientsCell(
                    icon: carbsIcon,
                    title: "Carbs",
                    onChanged: (value) {
                      setState(() {
                        carbsS = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: NutrientsCell(
                    icon: fatIcon,
                    title: "Fat",
                    onChanged: (value) {
                      setState(() {
                        fatS = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*class NutrientsDataChannel {
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
}*/
