import 'package:bounce/bounce.dart';
import 'package:calory/src/common_widgets/calorie_diet_view.dart';
import 'package:calory/src/features/authentication/screens/meal_planner/meal_schedule_screen.dart';
import 'package:calory/src/features/authentication/screens/meals_list_view/meals_list_view.dart';
import 'package:flutter/material.dart';
import 'package:calory/src/common/channels/dart_to_java_channels/home_channel.dart';
import 'package:flutter/widgets.dart';
import '../../../../constants/colors.dart';
import '../water_screen/water_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  String? username;
  double consumedCalories = 1000.0;
  double dailyCalorieGoal = 2000.0;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    fetchUsername();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchUsername() async {
    String? fetchedUsername = await HomeDataChannel.getCurrentUser();
    setState(() {
      username = fetchedUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    //double percentage = consumedCalories / dailyCalorieGoal;
    //double remainingCalories = dailyCalorieGoal - consumedCalories;

    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                        Text(
                          username ?? "",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/notification_active.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                /*Center(
                  child: Bounce(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealScheduleScreen()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Track your food',
                            style: TextStyle(fontSize: 10.0),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$remainingCalories kcal remaining',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Icon(Icons.next_plan_rounded),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          SimpleAnimationProgressBar(
                            height: 10,
                            width: media.width - 30,
                            backgroundColor: Colors.grey.shade100,
                            foregrondColor: Colors.purple,
                            ratio: percentage,
                            direction: Axis.horizontal,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(7.5),
                            gradientColor: LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: _animation,
                      child: Transform(
                        transform: new Matrix4.translationValues(
                            0.0, 30 * (1.0 - _animation!.value), 0.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text('Daily Kcal Analyser',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF17262A))),
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const MealScheduleScreen()),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Customize',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                            color: Color(0xFF2633C5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 38,
                                          width: 26,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Color(0xFF253840),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Bounce(
                  child: CalorieDietView(
                    animationController: _controller,
                    animation: _animation,
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: _animation,
                      child: Transform(
                        transform: new Matrix4.translationValues(
                            0.0, 30 * (1.0 - _animation!.value), 0.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text('Water',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF17262A))),
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Aqua SmartBottle',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                            color: Color(0xFF2633C5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 38,
                                          width: 26,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Color(0xFF253840),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Bounce(
                    child: WaterView(
                  mainScreenAnimationController: _controller,
                  mainScreenAnimation: _animation,
                )),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: _animation,
                      child: Transform(
                        transform: new Matrix4.translationValues(
                            0.0, 30 * (1.0 - _animation!.value), 0.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text('Meals Today',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF17262A))),
                                ),
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const MealScheduleScreen()),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Customize',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            letterSpacing: 0.5,
                                            color: Color(0xFF2633C5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 38,
                                          width: 26,
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Color(0xFF253840),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                MealsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
