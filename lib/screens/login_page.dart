import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/home.dart';
import 'package:heath_care_test/screens/sign_up.dart';
import 'package:heath_care_test/screens/splashScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var _islogin=true;
  var emailController=''; //=TextEditingController();
  var passController=''; //=TextEditingController();
  var _isVisible=false;
  void _submit(){
    final valid =  _formkey.currentState!.validate();

    if(valid){
      _formkey.currentState!.save();
      log(emailController);
      log(passController);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Align(
                          child:Image.asset("assets/images/doctors.png",
                            //width: 100,
                          ) ,
                        ),
                      ),
                
                      const Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'Gilroy Pro',
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        //controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        onChanged: (String value){
                          print(value);
                        },
                        onSaved: (value) {
                          emailController =value!;
                        },
                        decoration: InputDecoration(
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
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.white10,
                          ),
                          filled: true,
                          fillColor: Color(0x20ffffff),
                          focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                        validator: (value){
                          if(value == null || value.trim().isEmpty  || ! value .contains('@')){
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 200,
                        obscureText: !_isVisible,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        onSaved: (value) {
                          passController =value!;
                        },
                        onChanged: (String value){
                          print(value);
                        },
                        decoration: InputDecoration(
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
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() {
                              _isVisible = !_isVisible;
                            }),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white10,
                          ),
                          filled: true,
                          fillColor: Color(0x20ffffff),
                          focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                        validator: (value){
                          if(value == null || value.trim().length<6 ){
                            return 'password must be more than 6 characters';
                          }
                          return null;
                        },
                      ),

                        /*SizedBox(
                          height: 15,
                        ),*/

                        /*Padding(
                          padding: EdgeInsets.all(5),
                          child: InkWell(
                            onTap:() {
                              print(emailController.text);
                              print(passController.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Home_Page();
                              }));
                            },
                            borderRadius: BorderRadius.circular(100),
                            //focusColor: Colors.white,
                              child: Text(
                                'LOGIN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Gilroy Pro',
                                ),
                              ),
                          ),
                        ),*/

                      ElevatedButton(onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Theme.of(context).colorScheme.primaryContainer,
                        ),
                          child: Text(
                              'LOGIN',
                          ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUp()),);
                                  setState(() {
                                    _islogin = !_islogin;
                                  });
                                },
                                child: const Text(
                                  'Register Now',
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
      ),
    );
  }
}
