import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_string.dart';

class GetGenderScreen extends StatefulWidget {
  const GetGenderScreen({super.key});

  @override
  State<GetGenderScreen> createState() => _GetGenderScreenState();
}

class _GetGenderScreenState extends State<GetGenderScreen> {
  late double _selectedWeight;
  late double _selectedHeight;

  late String selectedGender;
  late int selectedAge;

  double dailyCalorieIntake = 0.0;

  double _progress = 0.0;
  int _currentPageIndex = 0;
  bool _isMaleSelected = false;
  bool _showMaleFemale = true;
  bool _showActivityText = false;
  bool _showGenderText = true;
  late DateTime _selectedDate;
  bool _showDatePicker = false;

  final List<Color> _pageColors = [
    const Color.fromARGB(255, 253, 253, 253),
    const Color.fromARGB(255, 253, 253, 253),
    const Color.fromARGB(255, 253, 253, 253),
    const Color.fromARGB(255, 253, 253, 253),
    const Color.fromARGB(255, 253, 253, 253),
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _completeProgress() {
    setState(() {
      _progress += 0.3; // Increment progress by 0.2 for each page
    });
  }

  void _resetProgress() {
    setState(() {
      _progress = 0.0;
    });
  }

  void _goToNextPage() {
    setState(() {
      if (_currentPageIndex < 4) {
        if (_currentPageIndex == 1) {
          _calculateAgeAndPrint(_selectedDate); // Print age on step 2
        }
        _currentPageIndex++;
        _completeProgress();
        _showMaleFemale = false;
        _showGenderText = false;
        if (_currentPageIndex == 4) {
          _showActivityText = true;
        }
        if (_currentPageIndex == 1) {
          _showDatePicker = true;
        } else {
          _showDatePicker = false;
        }
      }
    });
  }

  void _calculateAgeAndPrint(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    selectedGender = _isMaleSelected ? 'Male' : 'Female';
    selectedAge = age;
    print(' ${_isMaleSelected ? 'male' : 'female'}');
    print(' $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: _pageColors[_currentPageIndex],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: _stepIndicator(_progress, _isMaleSelected),
                        ),
                        Visibility(
                          visible: _currentPageIndex ==
                              0, // Show only on the first page
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isMaleSelected = true;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/newm.png',
                                            width: constraints.maxWidth * 0.3,
                                            height: constraints.maxHeight * 0.3,
                                          ),
                                          if (_isMaleSelected)
                                            Container(
                                              width: constraints.maxWidth * 0.3,
                                              height:
                                                  constraints.maxHeight * 0.3,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  width: 4,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isMaleSelected = false;
                                        });
                                      },
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/female3.png',
                                            width: constraints.maxWidth * 0.3,
                                            height: constraints.maxHeight * 0.3,
                                          ),
                                          if (!_isMaleSelected)
                                            Container(
                                              width: constraints.maxWidth * 0.3,
                                              height:
                                                  constraints.maxHeight * 0.3,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  width: 4,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                if (_showGenderText)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 200),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Knowing your gender helps us customize your',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'diet and exercise plans more accurately',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (_showDatePicker)
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'What is your age?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 50),
                                SizedBox(
                                  width: 500,
                                  height: 250,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: _selectedDate,
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      setState(() {
                                        _selectedDate = newDateTime;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Visibility(
                            visible:
                                _currentPageIndex == 1, // Only show on Step 2
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 100, top: 50, bottom: 180),
                              child: Text(
                                ' ${DateFormat('yyyy MMM dd').format(_selectedDate)}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_currentPageIndex == 2) _buildScreen2(),
                        if (_currentPageIndex == 3) _buildScreen3(),
                        if (_currentPageIndex == 4) _buildScreen4(),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20, // Set the distance from the bottom
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            _goToNextPage(); // Go to the next page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.black, // Change button color to black
                            minimumSize: Size(350, 80), // Set button size
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white, // Change text color to white
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0, // Adjust the left position
                      top: 0, // Adjust the top position
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Step ${_currentPageIndex + 1} / 5',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 112, 109, 109),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      right: 0,
                      // Adjust the left position
                      bottom: 400,
                      top: 70,
                      // Adjust the bottom position
                      child: Visibility(
                        visible: _showGenderText,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'which gender do you more closely',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'identify with?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80,
                      right: 0,
                      // Adjust the left position
                      bottom: 400,
                      top: 70,
                      // Adjust the bottom position
                      child: Visibility(
                        visible: _showActivityText,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activityLevel,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      bottom: 350,
                      child: Visibility(
                        visible: _showMaleFemale,
                        child: Text(
                          'Male',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 100,
                      bottom: 350,
                      child: Visibility(
                        visible: _showMaleFemale,
                        child: Text(
                          'Female',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScreen2() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select your weight',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          AnimatedWeightPicker(
            min: 30,
            max: 200,
            onChange: (value) {
              setState(() {
                _selectedWeight = double.parse(value);
              });
            },
          ),
          // Add your widgets for screen 2 here
        ],
      ),
    );
  }

  Widget _buildScreen3() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select your height',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          AnimatedWeightPicker(
            suffixText: 'cm',
            min: 100,
            max: 250,
            onChange: (value) {
              setState(() {
                _selectedHeight = double.parse(value);
              });
            },
          ),
          // Add your widgets for screen 3 here
        ],
      ),
    );
  }

  Widget _buildScreen4() {
    CarouselController buttonCarouselController = CarouselController();

    List<Map<String, dynamic>> activeArr = [
      {
        "image": splashImage,
        "title": sedentaryTitle,
        "subtitle": sedentarySubTitle
      },
      {
        "image": splashImage,
        "title": lightlyTitle,
        "subtitle": lightlySubTitle
      },
      {
        "image": splashImage,
        "title": moderatelyTitle,
        "subtitle": moderatelySubTitle
      },
      {"image": splashImage, "title": veryTitle, "subtitle": verySubTitle},
      {"image": splashImage, "title": extraTitle, "subtitle": extraSubTitle},
    ];

    late String selectedTitle = activeArr[0]["title"];

    var media = MediaQuery.of(context).size;

    return Stack(
      children: [
        Center(
          child: CarouselSlider(
            items: activeArr
                .map(
                  (gObj) => Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: media.width * 0.1, horizontal: 25),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            gObj["image"].toString(),
                            width: media.width * 0.5,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(
                            height: media.width * 0.1,
                          ),
                          Text(
                            gObj["title"].toString(),
                            style: TextStyle(
                                color: TColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            width: media.width * 0.1,
                            height: 1,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            height: media.width * 0.02,
                          ),
                          Text(
                            gObj["subtitle"].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: TColor.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: 475,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              aspectRatio: 0.74,
              initialPage: 0,
              onPageChanged: (index, _) {
                setState(() {
                  selectedTitle = activeArr[index]["title"];
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _stepIndicator(double value, bool isMaleSelected) {
    String text = 'Step ${(value * 5).toStringAsFixed(0)} of 5 Completed';
    return Column(
      children: [
        SizedBox(height: 25.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10.0,
            backgroundColor: Colors.black,
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 209, 71, 12),
            ),
          ),
        ),
        SizedBox(height: 25.0),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 25.0),
      ],
    );
  }
}
