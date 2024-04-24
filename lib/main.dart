import 'package:calory/src/features/authentication/screens/add_nutrients_screen/add_nutrients.dart';
import 'package:calory/src/features/authentication/screens/get_profile_screen/get_gender_screen.dart';
import 'package:calory/src/features/authentication/screens/get_profile_screen/get_profile_screen.dart';
import 'package:calory/src/features/authentication/screens/home_screen/home_view.dart';
import 'package:calory/src/features/authentication/screens/main_tab/main_tab_view.dart';
import 'package:calory/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:calory/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:calory/src/features/authentication/screens/water_screen/water_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: HomeView(),
    );
  }
}


/*class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  TextEditingController _textController1 = TextEditingController();
  late CameraController _cameraController;
  Uint8List? _imagefile;

  Future<void> _getImage() async{
    List<CameraDescription> cameras;
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
    //final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    final pickedFile  = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() async {
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        _imagefile = bytes;
      } else {
        print('No image selected.');
      }
    });

  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String weight = _textController.text;
      String name = _textController1.text;
      FormDataChannel.submitFormData(weight,name,_imagefile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter Your Food Weight'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _textController1,
                decoration: InputDecoration(labelText: 'Enter Your Food'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 300),
              ElevatedButton(
                onPressed: _getImage,
                child: Text('Take Picture'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<ui.Image> getImageFromPath(String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }}

class FormDataChannel {    // image channel
  static const MethodChannel _channel = MethodChannel('form_data_channel');

  static Future<void> submitFormData(String weight, String name, Uint8List? bitmap) async {
    try {
      await _channel.invokeMethod('submitFormData', {"weight": weight,"name": name,"path":bitmap});
    } on PlatformException catch (e) {
      print("Failed to submit form data: '${e.message}'.");
    }
  }
}*/
//


