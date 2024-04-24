import 'package:calory/src/common_widgets/nutrients_cell.dart';
import 'package:calory/src/common_widgets/round_button.dart';
import 'package:calory/src/constants/image_strings.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/colors.dart';

class AddNutrients extends StatefulWidget {
  const AddNutrients({super.key});

  @override
  State<AddNutrients> createState() => _AddNutrientsState();
}

class _AddNutrientsState extends State<AddNutrients> {
  late double proteinS;

  late double carbsS;
  late double fatS;

  late double weightS;
  late String nameS = '';

  late CameraController _cameraController;

  Uint8List? _imagefile;

  Future<void> _getImage() async {
    List<CameraDescription> cameras;
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
    //final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() async {
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        _imagefile = bytes;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
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
                        proteinS = double.parse(value);
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
                        carbsS = double.parse(value);
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
                        fatS = double.parse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: NutrientsCell(
                    icon: proteinIcon,
                    title: "Weight",
                    onChanged: (value) {
                      setState(() {
                        weightS = double.parse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2)
                      ],
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                nameS = value;
                              });
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                            ),
                            decoration: InputDecoration(
                              hintText: "food name",
                              hintStyle: TextStyle(color: TColor.gray),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: RoundButton(
                  onPressed: () {
                    print(proteinS);
                    print(carbsS);
                    print(fatS);
                    print(weightS);
                    print(nameS);
                  },
                  title: 'Click'),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: _getImage,
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.secondaryG),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.photo_camera,
            size: 20,
            color: TColor.white,
          ),
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
