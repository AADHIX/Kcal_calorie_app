import 'package:calory/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class NutrientPage extends StatefulWidget {
  @override
  _NutrientPageState createState() => _NutrientPageState();
}

class _NutrientPageState extends State<NutrientPage> {
  int proteinCount = 0;
  int carbsCount = 0;
  int fatCount = 0;

  void incrementProtein() {
    setState(() {
      proteinCount++;
    });
  }

  void decrementProtein() {
    if (proteinCount > 0) {
      setState(() {
        proteinCount--;
      });
    }
  }

  void incrementCarbs() {
    setState(() {
      carbsCount++;
    });
  }

  void decrementCarbs() {
    if (carbsCount > 0) {
      setState(() {
        carbsCount--;
      });
    }
  }

  void incrementFat() {
    setState(() {
      fatCount++;
    });
  }

  void decrementFat() {
    if (fatCount > 0) {
      setState(() {
        fatCount--;
      });
    }
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
        // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage(proteinIcon),
                      width: 25,
                      height: 30,
                      fit: BoxFit.contain,
                      color: TColor.gray,
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          'Proteins',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text('$proteinCount'),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: decrementProtein,
                    ),
                    Material(
                      elevation: 4,
                      // Adjust elevation value as needed
                      shadowColor: Colors.grey,
                      // Optional: Adjust shadow color
                      borderRadius: BorderRadius.circular(10),
                      // Optional: Adjust border radius
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(8),
                        // Optional: Adjust padding as needed
                        child: Center(child: Text('$proteinCount')),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: incrementProtein,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage(carbsIcon),
                      width: 25,
                      height: 30,
                      fit: BoxFit.contain,
                      color: TColor.gray,
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          'Carbs',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text('$carbsCount'),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: decrementCarbs,
                    ),
                    Material(
                      elevation: 4,
                      // Adjust elevation value as needed
                      shadowColor: Colors.grey,
                      // Optional: Adjust shadow color
                      borderRadius: BorderRadius.circular(10),
                      // Optional: Adjust border radius
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(8),
                        // Optional: Adjust padding as needed
                        child: Center(child: Text('$carbsCount')),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: incrementCarbs,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Carbs',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: decrementCarbs,
                    ),
                    Text('$carbsCount'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: incrementCarbs,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Fat',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: decrementFat,
                    ),
                    Text('$fatCount'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: incrementFat,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Food',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add food functionality
                    // You can use proteinCount, carbsCount, fatCount here
                  },
                  child: Text('Add Food'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
