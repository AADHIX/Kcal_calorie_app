import 'package:calory/src/common_widgets/meal_selection_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import 'helpers/food_quantity.dart';

/*class FoodSelectionScreen extends StatefulWidget {
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

  static final List<String> _items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    // Add more items here...
  ];


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
                    child:
                    TextField(
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
}*/

class FoodSelectionScreen extends StatefulWidget {
  const FoodSelectionScreen({super.key});

  @override
  State<FoodSelectionScreen> createState() => _FoodSelectionScreenState();
}

class _FoodSelectionScreenState extends State<FoodSelectionScreen> {
  List<Map<String, String>> foodListArr = [
    {"name": "Honey Pancake", "image": splashImage},
    {"name": "Coffee", "image": splashImage},
    {"name": "Chicken Steak", "image": splashImage},
    {"name": "Milk", "image": splashImage},
    {"name": "Orange", "image": splashImage},
    {"name": "Apple Pie", "image": splashImage},
    {"name": "Salad", "image": splashImage},
    {"name": "Oatmeal", "image": splashImage},
    {"name": "Honey Pancake", "image": splashImage},
    {"name": "Coffee", "image": splashImage},
    {"name": "Chicken Steak", "image": splashImage},
    {"name": "Milk", "image": splashImage},
    {"name": "Orange", "image": splashImage},
    {"name": "Apple Pie", "image": splashImage},
    {"name": "Salad", "image": splashImage},
    {"name": "Oatmeal", "image": splashImage},
    {"name": "Honey Pancake", "image": splashImage},
    {"name": "Coffee", "image": splashImage},
    {"name": "Chicken Steak", "image": splashImage},
    {"name": "Milk", "image": splashImage},
    {"name": "Orange", "image": splashImage},
    {"name": "Apple Pie", "image": splashImage},
    {"name": "Salad", "image": splashImage},
    {"name": "Oatmeal", "image": splashImage},
    {"name": "Honey Pancake", "image": splashImage},
    {"name": "Coffee", "image": splashImage},
    {"name": "Chicken Steak", "image": splashImage},
    {"name": "Milk", "image": splashImage},
    {"name": "Orange", "image": splashImage},
    {"name": "Apple Pie", "image": splashImage},
    {"name": "Salad", "image": splashImage},
    {"name": "Oatmeal", "image": splashImage},
    {"name": "Honey Pancake", "image": splashImage},
    {"name": "Coffee", "image": splashImage},
    {"name": "Chicken Steak", "image": splashImage},
    {"name": "Milk", "image": splashImage},
    {"name": "Orange", "image": splashImage},
    {"name": "Apple Pie", "image": splashImage},
    {"name": "Salad", "image": splashImage},
    {"name": "Oatmeal", "image": splashImage}
    // Add more items here...
  ];

  // List to hold selected food items and their quantities
  List<Map<String, dynamic>> selectedFoodList = [];

  TextEditingController searchController = TextEditingController();

  // List to hold filtered food items
  List<Map<String, String>> filteredFoodList = [];

  // Current page index for pagination
  int _currentPage = 0;

  // Page size for pagination
  final int _pageSize = 10;

  // Scroll controller to monitor scroll position
  final ScrollController _scrollController = ScrollController();

  // Flag to indicate whether data is being loaded
  bool _isLoading = false;

  // Method to handle when an item is submitted in onItemTapped
  void _onSubmit(Map<String, dynamic> data) {
    // Store the submitted data in the selectedFoodList
    setState(() {
      selectedFoodList.add(data);
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all items initially
    filteredFoodList = List.from(foodListArr);

    // Load the first page of data
    _loadMoreData();

    // Add a listener to the scroll controller to detect when the user has scrolled to the bottom
    _scrollController.addListener(() {
      // Load more data when the user reaches the bottom of the list
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  // Method to filter the food list based on the search query
  void _filterFoodList(String query) {
    setState(() {
      filteredFoodList = foodListArr
          .where((foodItem) =>
              foodItem['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Reset pagination
      _currentPage = 0;
      // Reset the list
      _isLoading = false;
      _loadMoreData(); // Load the first page of data
    });
  }

  // Method to load more data
  void _loadMoreData() {
    // If already loading or all data has been loaded, do not proceed
    if (_isLoading || _currentPage * _pageSize >= filteredFoodList.length) {
      return;
    }

    setState(() {
      _isLoading = true;

      // Calculate start and end index for the page
      final startIndex = _currentPage * _pageSize;
      final endIndex = startIndex + _pageSize;

      // Add new items from the filtered list
      final newItems = filteredFoodList.sublist(
          startIndex, endIndex.clamp(0, filteredFoodList.length));

      // Append the new items to the existing list
      filteredFoodList.addAll(newItems);

      // Update the current page index
      _currentPage += 1;

      // Set loading flag to false
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Text(
          "Select Food",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                // Handle "Add your own food" button click
              },
              child: Text(
                "Add your own food",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: media.width * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  autocorrect: true,
                  controller: searchController,
                  onChanged: (query) {
                    _filterFoodList(
                        query); // Filter the food list based on the search query
                  },
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
          SizedBox(
            height: media.width * 0.10,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredFoodList.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                var foodItem = filteredFoodList[index];
                return MealSelectionRow(
                  mObj: foodItem,
                  index: index,
                  onItemTapped: (item) {
                    onItemTapped(context, item, _onSubmit);
                  },
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          TextButton(onPressed: () {print(selectedFoodList);}, child: Text('submit')),
        ],
      ),
    );
  }
}
