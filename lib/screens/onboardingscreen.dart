import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/login_page.dart';
import 'package:heath_care_test/screens/sign_up.dart';

class OnBoard extends StatefulWidget {

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  Widget dotPageView() {
    return Builder(builder: ((context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 2; i++)
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
      backgroundColor: Colors.black,
      body: PageView(
        onPageChanged: (value) {
          setState(() {});
          pagenumber = value;
        },
        controller: nextpage,
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/images/414-bg.png",
                width: 500.0,
                height: 500.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Health Tips",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                    color: Colors.white),
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
                    color: Colors.grey),
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
                    color: Color(0xff85C4E2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              dotPageView()
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/images/logo2.png",
                width: 500.0,
                height: 500.0,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy',
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Body mass index helps you \nknow your health status",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy Pro',
                    color: Colors.grey),
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
                    color: Color(0xff85C4E2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy',
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              dotPageView()
            ],
          ),
        ],
      ),
    );
  }
}