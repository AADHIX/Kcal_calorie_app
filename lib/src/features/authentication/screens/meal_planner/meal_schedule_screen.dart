import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:calory/src/constants/image_strings.dart';
import 'package:calory/src/features/authentication/screens/meal_planner/food_selection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common_widgets/meal_food_schedule_row.dart';
import '../../../../common_widgets/nutritions_row.dart';
import '../../../../constants/colors.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class MealScheduleScreen extends StatefulWidget {
  const MealScheduleScreen({super.key});

  @override
  State<MealScheduleScreen> createState() => _MealScheduleScreenState();
}

class _MealScheduleScreenState extends State<MealScheduleScreen> {

  bool isDropdownBrVisible = false; // To manage the visibility of the dropdown list
  bool isDropdownLnVisible = false; // To manage the visibility of the dropdown list
  bool isDropdownSnVisible = false; // To manage the visibility of the dropdown list
  bool isDropdownDnVisible = false; // To manage the visibility of the dropdown list

  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;

  List<String> selectedFoodItems = []; //marked food items list

  List breakfastArr = [
    {"name": "Honey Pancake", "time": "07:00am", "image": splashImage},
    {"name": "Coffee", "time": "07:30am", "image": splashImage},
  ];

  List lunchArr = [
    {"name": "Chicken Steak", "time": "01:00pm", "image": splashImage},
    {"name": "Milk", "time": "01:20pm", "image": splashImage},
  ];
  List snacksArr = [
    {"name": "Orange", "time": "04:30pm", "image": splashImage},
    {"name": "Apple Pie", "time": "04:40pm", "image": splashImage},
  ];
  List dinnerArr = [
    {"name": "Salad", "time": "07:10pm", "image": splashImage},
    {"name": "Oatmeal", "time": "08:10pm", "image": splashImage},
  ];

  List nutritionArr = [
    {
      "title": "Calories",
      "image": splashImage,
      "unit_name": "kCal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": splashImage,
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": splashImage,
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
    {
      "title": "Carbo",
      "image": splashImage,
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
          "Meal  Schedule",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/arrow-left.png",
                  width: 15,
                  height: 15,
                )),
            training: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/arrow-right.png",
                  width: 15,
                  height: 15,
                )),
            weekDay: WeekDay.short,
            dayNameFontSize: 12,
            dayNumberFontSize: 16,
            dayBGColor: Colors.grey.withOpacity(0.15),
            titleSpaceBetween: 15,
            backgroundColor: Colors.transparent,
            // fullCalendar: false,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: 'en',

            initialDate: DateTime.now(),
            calendarEventColor: TColor.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),

            onDateSelected: (date) {
              _selectedDateAppBBar = date;
            },
            selectedDayLogo: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isDropdownBrVisible = !isDropdownBrVisible;
                          });
                        },
                        child: Text(
                          "BreakFast",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.02,
                      ),
                      Text(
                          "(${breakfastArr.length} Items | 230 calories)",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FoodSelectionScreen()),
                            );
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined)),
                    ],
                  ),
                ),
                Visibility(
                  visible: isDropdownBrVisible,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: breakfastArr.length,
                      itemBuilder: (context, index) {
                        var mObj = breakfastArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(
                          mObj: mObj,
                          index: index,
                          onCheckboxChanged: (foodName, isChecked) {
                            // for handling checkbox changes
                            setState(() {
                              if (isChecked) {
                                selectedFoodItems.add(foodName);
                              } else {
                                selectedFoodItems.remove(foodName);
                              }
                            });
                          },
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isDropdownLnVisible = !isDropdownLnVisible;
                          });
                        },
                        child: Text(
                          "Lunch",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.02,
                      ),
                     Text(
                          "(${lunchArr.length} Items | 500 calories)",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const FoodSelectionScreen()),
                            );
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined)),
                    ],
                  ),
                ),
                Visibility(
                  visible: isDropdownLnVisible,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lunchArr.length,
                      itemBuilder: (context, index) {
                        var mObj = lunchArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(
                          mObj: mObj,
                          index: index,
                          onCheckboxChanged: (foodName, isChecked) {
                            setState(() {
                              if (isChecked) {
                                selectedFoodItems.add(foodName);
                              } else {
                                selectedFoodItems.remove(foodName);
                              }
                            });
                          },
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isDropdownSnVisible = !isDropdownSnVisible;
                          });
                        },
                        child: Text(
                          "Snacks",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.02,
                      ),
                      Text(
                          "(${snacksArr.length} Items | 140 calories)",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const FoodSelectionScreen()),
                            );
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined)),
                    ],
                  ),
                ),
                Visibility(
                  visible: isDropdownSnVisible,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snacksArr.length,
                      itemBuilder: (context, index) {
                        var mObj = snacksArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(
                          mObj: mObj,
                          index: index,
                          onCheckboxChanged: (foodName, isChecked) {
                            setState(() {
                              if (isChecked) {
                                selectedFoodItems.add(foodName);
                              } else {
                                selectedFoodItems.remove(foodName);
                              }
                            });
                          },
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isDropdownDnVisible = !isDropdownDnVisible;
                          });
                        },
                        child: Text(
                          "Dinner",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.02,
                      ),
                      Text(
                          "(${dinnerArr.length} Items | 120 calories)",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const FoodSelectionScreen()),
                            );
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined)),
                    ],
                  ),
                ),
                Visibility(
                  visible: isDropdownDnVisible,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dinnerArr.length,
                      itemBuilder: (context, index) {
                        var mObj = dinnerArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(
                          mObj: mObj,
                          index: index,
                          onCheckboxChanged: (foodName, isChecked) {
                            setState(() {
                              if (isChecked) {
                                selectedFoodItems.add(foodName);
                              } else {
                                selectedFoodItems.remove(foodName);
                              }
                            });
                          },
                        );
                      }),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Meal Nutritions",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nutritionArr.length,
                    itemBuilder: (context, index) {
                      var nObj = nutritionArr[index] as Map? ?? {};

                      return NutritionRow(
                        nObj: nObj,
                      );
                    }),
                TextButton(
                    onPressed: () {
                      print(selectedFoodItems);
                    },
                    child: Text("click")),
                SizedBox(
                  height: media.width * 0.05,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

