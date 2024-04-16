import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:calory/src/common_widgets/meal_selection_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class FoodSelectionScreen extends StatefulWidget {
  const FoodSelectionScreen({super.key});

  @override
  State<FoodSelectionScreen> createState() => _FoodSelectionScreenState();
}

class _FoodSelectionScreenState extends State<FoodSelectionScreen> {
  List foodListArr = [
    {"name": "Honey Pancake", "image": splashImage},
    {"name": "Coffee", "image": splashImage},
    {"name": "Chicken Steak", "image": splashImage},
    {"name": "Milk", "image": splashImage},
    {"name": "Orange", "image": splashImage},
    {"name": "Apple Pie", "image": splashImage},
    {"name": "Salad", "image": splashImage},
    {"name": "Oatmeal", "image": splashImage},
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: false,
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
          "Select Food",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: media.width * 0.03,
              ),
              Text(
                "Add your own food",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: media.width * 0.05,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: TColor.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ]),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Image.asset(
                            "assets/images/search.png",
                            width: 25,
                            height: 25,
                          ),
                          hintText: "Search Pancake"),
                    )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 1,
                  height: 25,
                  color: TColor.gray.withOpacity(0.3),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/filter.png",
                    width: 25,
                    height: 25,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: foodListArr.length,
                    itemBuilder: (context, index) {
                      var mObj = foodListArr[index] as Map? ?? {};
                      return MealSelectionRow(
                        mObj: mObj,
                        index: index,
                      );
                    }),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

dynamic searchSubmit(String string) {
  print(string);
}
