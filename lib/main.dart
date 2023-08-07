import 'package:flutter/material.dart';
import 'second_page.dart'; // Import the new page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePageClass(title: 'Welcome to Plan it'),
    );
  }
}

class MyHomePageClass extends StatelessWidget {
  const MyHomePageClass({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 0),
                Text(
                  "Plan IT",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Your Personal task management and planning solution",
                style: TextStyle(fontSize: 16, fontFamily: "Inter"),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(180, 17),
                ),
                child: Text(
                  "Let’s get started",
                  style: TextStyle(color: Colors.white, fontFamily: "Inter"),
                ),
                onPressed: () {
                  // Do something
                  // Navigate to the second page when the button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
              ),
              SizedBox(height: 150), // Add a blank space
            ],
          ),
        ],
      ),
    );
  }
}
