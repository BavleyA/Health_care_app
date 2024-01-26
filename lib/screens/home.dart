import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/BMI.dart';
import 'package:heath_care_test/screens/health_tips_page.dart';
import 'package:heath_care_test/screens/login_page.dart';
import 'package:heath_care_test/screens/workout.dart';
import 'package:heath_care_test/screens/profile.dart';


class Home_Page extends StatefulWidget {
  State<Home_Page> createState() => _Home_PageState();
}
class _Home_PageState extends State<Home_Page> {
  int currentIndex = 0;
  final screens = [
    Health_Tips(),
    BMI_calculator(),
    Workouts(),
    profile(),
  ];
  Widget build(context) {
    return Scaffold(

      backgroundColor: Colors.black,
      drawer: Drawer(
        width: 250,

        backgroundColor: Colors.white,
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    LoginPage()), (Route<dynamic> route) => false);
              },
              child: Card(
                color: Color(0xffD3C9E3),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedFontSize: 16,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department_outlined),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My profile',
          ),
        ],
      ),
    );
  }
}
