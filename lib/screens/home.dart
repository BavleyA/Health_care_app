import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final heightM = TextEditingController();
  final mass = TextEditingController();
  double result = 0, h = 0, m = 0;

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

  Widget build(context) {
    var tips_and_updates;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          width:250,
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Health Care App      ",
              style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'Pacifico',
                  fontSize: 30),
            ),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.tips_and_updates,                     // back here look at again//////////////
                  color: Colors.black,
                ),
                child: Text(
                  'Health Tips',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: "Lora"),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.calculate_outlined,
                  color: Colors.black,
                ),
                child: Text(
                  'BMI',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: "Lora"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tips[index],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Lora"),
                    ),
                  );
                },
              ),
            ),
            ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: heightM,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.blue, width: 2)),
                                hintText: 'Height in meter',
                                hintStyle:
                                TextStyle(fontSize: 18, color: Colors.white),
                                fillColor: Colors.white,
                                hoverColor: Colors.white),
                            cursorColor: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 50),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.light,
                            controller: mass,
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'mass in kg',
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                                fillColor: Color.fromARGB(255, 237, 238, 239)),
                            cursorColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 150),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xff85C4E2),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              h = double.parse(heightM.text);
                              m = double.parse(mass.text);
                              result =
                                  double.parse((m / (h * h)).toStringAsFixed(1));
                              if (h > 3) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                        content: Text(
                                          "Height in M not CM!",
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ));
                                  },
                                );
                              }
                              else if (result < 18.5) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: message(
                                          'Underweight',
                                          result,
                                          Colors.orange,
                                          '\nyou have lower than normal body weight \ntry to eat more'),
                                    );
                                  },
                                );
                              }
                              else if (result >= 18.5 && result <= 24.9) {
                                {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: message(
                                            'Normal',
                                            result,
                                            Colors.green,
                                            '\nyou have a normal body weight \nGood job!'),
                                      );
                                    },
                                  );
                                }
                              }
                              else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: message(
                                          'Overweight',
                                          result,
                                          Colors.redAccent,
                                          '\nyou have a more than normal body weight \nTry to do exercise!'),
                                    );
                                  },
                                );
                              }
                            });
                          },
                          child: const Text(
                            "Calculate",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/logo2.png",
                    width: 280.0,
                    height: 280.0,
                  ),
                ],

            ),
          ],
        ),
      ),
    );
  }
}

class message extends StatelessWidget {
  message(this.status, this.bmi, this.fontColor, this.tip);
  double bmi;
  String? status;
  Color? fontColor;
  String? tip;

  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 200,
      child: Column(
        children: [
          Text(
            '$status',
            style: TextStyle(fontSize: 24, color: fontColor),
          ),
          Text(
            '$bmi',
            style: TextStyle(fontSize: 60),
          ),
          Text(
            "\nNormal BMI range : ",
            style: TextStyle(color: Colors.grey),
          ),
          Text('18.5 - 25 kg/m2'),
          Text(
            "$tip",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}