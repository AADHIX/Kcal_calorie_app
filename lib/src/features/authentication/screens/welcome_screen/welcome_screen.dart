import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Image.asset('assets/image1.png', width: 100, height: 100),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: Image.asset('assets/image2.png', width: 100, height: 100),
            ),
            Positioned(
              top: 100.0,
              right: 20.0,
              child: Image.asset('assets/image3.png', width: 100, height: 100),
            ),
            Positioned(
              bottom: 100.0,
              left: 20.0,
              child: Image.asset('assets/image4.png', width: 100, height: 100),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to MyApp',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Action to perform when the button is pressed
                    },
                    child: Text('Start'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
