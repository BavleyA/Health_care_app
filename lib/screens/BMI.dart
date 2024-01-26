import 'package:flutter/material.dart';
import 'package:heath_care_test/DBsql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:heath_care_test/screens/sign_up.dart';
import 'package:heath_care_test/session_manager.dart';
import 'package:heath_care_test/screens/records.dart';

class BMI_calculator extends StatefulWidget {
  @override
  State<BMI_calculator> createState() => _BMI_calculatorState();
}
sqldb sql=sqldb();
class _BMI_calculatorState extends State<BMI_calculator> {
  var heightM = TextEditingController();
  final mass = TextEditingController();
  double result = 0, h = 0, m = 0;
  String UserName="";


  void _saveRecord() async {
    String? userName = SessionManager.username;
    if (userName != null) {
      double bmiResult = double.parse((m / (h * h)).toStringAsFixed(1));
      String currentDate = DateTime.now().toString();
      int result = await sql.insertBMIRecord(h, m,bmiResult,currentDate);

      if (result > 0) {
        print('Record saved successfully');
      } else {
        print('Error saving record');
      }
    }
  }

  void _getAllRecordsForSignedInUser() async {
    String? userName = SessionManager.username;
    if (userName != null) {
      List<Map<String, dynamic>> records = await sql.getAllBMIRecordsForUser();
      print('All records for user $userName: $records');
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor:Colors.cyan.shade200,
        centerTitle: true,
        title: const Tab(
          icon: Icon(
            Icons.calculate_outlined, // back here look at again//////////////
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'BMI calculator',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontFamily: "Lora"),
            ),
          ),
        ),
      ),
      body: ListView(
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
                    style:const TextStyle(color: Colors.black),
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2)),
                        hintText: 'Height in meter',
                        hintStyle:
                        TextStyle(fontSize: 18, color: Colors.black54),
                        fillColor: Colors.white,
                        hoverColor: Colors.white
                    ),
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 20, left: 50),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.light,
                    controller: mass,
                    style:const TextStyle(color: Colors.black),
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                        ),
                        hintText: 'mass in kg',
                        hintStyle:
                        TextStyle(fontSize: 18.0, color: Colors.black54),
                        fillColor: Color.fromARGB(255, 237, 238, 239)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: SizedBox(
              height: 50.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                    Colors.cyan.shade200,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      h = double.parse(heightM.text);
                      m = double.parse(mass.text);
                      result = double.parse((m / (h * h)).toStringAsFixed(1));
                      _saveRecord();
                      if (h > 3) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Text(
                                  "Height in M not CM!",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ));
                          },
                        );
                      } else if (result < 18.5) {
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
                      } else if (result >= 18.5 && result <= 24.9) {
                        {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: message('Normal', result, Colors.green,
                                    '\nyou have a normal body weight \nGood job!'),
                              );
                            },
                          );
                        }
                      } else {
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
                  child: Text(
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

          Padding(
            padding: EdgeInsets.only(top: 50),
            child: SizedBox(
              height: 50.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    //minimumSize: Size.fromWidth(100),
                    backgroundColor: Colors.cyan.shade200,
                  ),
                  onPressed: () {
                    /*_getAllRecordsForSignedInUser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bmirecords()),);*/
                    setState(() {
                        _getAllRecordsForSignedInUser();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => bmirecords()),);
                    });
                  },
                  child: Text(
                    "Get my records",
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
