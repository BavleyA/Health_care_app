import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/BMI.dart';
import 'package:heath_care_test/screens/health_tips_page.dart';
class Home_Page extends StatefulWidget {
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int currentIndex = 0;
  final screens = [
    Health_Tips(),
    BMI_calculator(),
  ];
  Widget build(context) {
    return Scaffold(

      backgroundColor: Colors.black,
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.cyanAccent.shade700,
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                color: Colors.white54,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan.shade700,
        selectedFontSize: 16,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates),
            label: 'Health Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'BMI',
          ),
        ],
      ),
    );
  }
}
