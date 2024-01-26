import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/login_page.dart';

import 'package:heath_care_test/screens/home.dart';

class OnBoard extends StatefulWidget {
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  Widget dotPageView() {
    return Builder(builder: ((context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              width: i == pagenumber ? 25 : 6,
              height: 6,
              decoration: BoxDecoration(
                  color: i == pagenumber ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(50)),
            ),
        ],
      );
    }));
  }

  PageController nextpage = PageController();
  int pagenumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        onPageChanged: (value) {
          setState(() {});
          pagenumber = value;
        },
        controller: nextpage,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Image.asset(
                    "assets/images/414-bg.png",
                    width: 400.0,
                    height: 400.0,
                  ),
                ),
                Text(
                  "Health Tips",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Health Tips Make Your Life Better',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy Pro',
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    nextpage.animateToPage(1,
                        duration: Duration(milliseconds: 700),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    height: 54,
                    width: 114,
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Image.asset(
                  "assets/images/logo2.png",
                  width: 400.0,
                  height: 400.0,
                ),
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Body Mass Index Helps You Know Your Health Status",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy Pro',
                  color: Colors.black38,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  nextpage.animateToPage(2,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeIn);
                },
                child: Container(
                  height: 56,
                  width: 165,
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/images/34.png",
                width: 400.0,
                height: 400.0,
              ),
              Text(
                "Work Out",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Your journey to a healthier you starts with each intentional move.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy Pro',
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Container(
                  height: 56,
                  width: 165,
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
