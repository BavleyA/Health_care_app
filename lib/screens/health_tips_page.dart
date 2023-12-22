import 'package:flutter/material.dart';
class Health_Tips extends StatelessWidget {
  List<String> tips = [
    '1. Measure and Watch Your Weight',
    '   Keeping track of your body weight on a daily or weekly basis will help you see what you are losing and/or what you are gaining.',
    '2. Limit Unhealthy Foods and Eat Healthy Meals',
    '   Do not forget to eat breakfast and choose a nutritious meal with more protein and fiber and less fat, sugar, and calories.',
    '3. Take Multivitamin Supplements',
    '   To make sure you have sufficient levels of nutrients, taking a daily multivitamin supplement is a good idea.',
    '4. Drink Water and Stay Hydrated, and Limit Sugared Beverages',
    '   Drink water regularly to stay healthy, but there is NO evidence that drinking water frequently can help prevent any viral infection.'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor:const Color(0xffD3C9E3),
        centerTitle: true,
        title:const Tab(
          icon: Icon(
            Icons.tips_and_updates,                     // back here look at again//////////////
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Health Tips',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontFamily: "Lora"),
            ),
          ),
        ),
      ),
      body :ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tips[index],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "Lora"
              ),
            ),
          );
        },
      ),
    );
  }
}
