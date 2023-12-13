import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/home.dart';
import 'package:heath_care_test/screens/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
var emailcon=TextEditingController();
var passcon=TextEditingController();
var namecon=TextEditingController();
var passconfirm=TextEditingController();
var _isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(padding: EdgeInsets.all(20),
                      child: Image.asset('assets/images/doctors.png'
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 8)
                    ),
                    Text(
                      'let\'s Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.cyan.shade800,
                        fontWeight: FontWeight.bold,
                        //fontFamily: 'Gilroy Pro',
                        fontSize: 40,
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: namecon,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          //color: Colors.white,
                        ),
                        onSubmitted: (value){
                          print(value);
                        },
                        onChanged: (String value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3, color: Colors.cyan.shade700,),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700 ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                           // color: Colors.white,
                          ),
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: Colors.cyan.shade700,
                          ),
                          filled: true,
                          fillColor: Color(0x20ffffff),
                          focusColor: Colors.red,
                        ),
                      ),
                    ),

                    //SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: emailcon,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          //color: Colors.white,
                        ),
                        onSubmitted: (value){
                          print(value);
                        },
                        onChanged: (String value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3, color: Colors.cyan.shade700,),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700 ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            //color: Colors.cyan.shade700,
                          ),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: Colors.cyan.shade700,
                          ),
                          filled: true,
                          fillColor: Color(0x20ffffff),
                          focusColor: Colors.red,
                        ),
                      ),
                    ),

                   // SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: passcon,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 200,
                        obscureText: !_isVisible,
                        style: TextStyle(
                          //color: Colors.white,
                        ),
                        onSubmitted: (value){
                          print(value);
                        },
                        onChanged: (String value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700,),
                            borderRadius: BorderRadius.circular(75),
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700 ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            //color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() {
                              _isVisible = !_isVisible;
                            }),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.cyan.shade700,
                          ),
                          filled: true,
                          fillColor: Color(0x20ffffff),
                          focusColor: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: passconfirm,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 200,
                        obscureText: !_isVisible,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onSubmitted: (value){
                          print(value);
                        },
                        onChanged: (String value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3, color: Colors.cyan.shade700,),
                            borderRadius: BorderRadius.circular(75),
                          ),
                          focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700 ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            //color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() {
                              _isVisible = !_isVisible;
                            }),
                          ),
                          labelText: 'confirm Password',
                          labelStyle: TextStyle(
                            color: Colors.cyan.shade700,
                          ),
                          filled: true,
                          fillColor: Color(0x20ffffff),
                          focusColor: Colors.red,
                        ),
                      ),

                    ),

                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home_Page()),);
                      setState(() {});
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.cyan.shade800,
                      ),
                      child: Text(
                          'Signup',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Have an Account ?',
                          style: TextStyle(
                              color: Colors.black,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),);
                              setState(() {});
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.cyan.shade800,
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              ),
            ),
          ),
      );
  }
}
