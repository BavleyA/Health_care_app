import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:heath_care_test/DBsql.dart';
import 'package:heath_care_test/screens/home.dart';
import 'package:heath_care_test/screens/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  sqldb sql= sqldb();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
var emailcon=TextEditingController();
var passcon=TextEditingController();
var namecon=TextEditingController();
var usrnamecon=TextEditingController();
var passconfirm=TextEditingController();
var _isVisible=false;
signup()async{
  int res= await sql.insertData("INSERT INTO 'USERS' ('name','user_name','email','user_pass') VALUES ('${namecon.text}','${usrnamecon.text}','${emailcon.text}','${passcon.text}')");
  if(res>0) {
    print(res);
    if(!mounted) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

bool x=false;
  Future<void> _checkEmailExistence() async {
    String email = emailcon.text.trim();
    if (email.isNotEmpty) {
      bool emailExists = await sql.doesEmailExist(emailcon.text);
      x = emailExists;
      if (emailExists) {
        _showResultDialog('email already exsists');
      } else {
        _checkUserExistence();
      }
    }
    }
  Future<void> _checkUserExistence() async {
    String usr = usrnamecon.text.trim();
    if (usr.isNotEmpty) {
      bool userExists = await sql.doesUserExist(usrnamecon.text);
      //x = emailExists;
      if (userExists) {
        _showResultDialog('User name already exsists');
      } else {
        _submit();
      }
    }
  }
  Future<void> _showResultDialog(String message) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('ALERT'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
   _submit() async {
     final valid = _formkey.currentState!.validate();

     if (valid) {
       _formkey.currentState!.save();
       log(emailcon.text);
       log(passcon.text);
       int res = await sql.insertData("INSERT INTO 'USERS' ('name','user_name','email','user_pass') VALUES ('${namecon.text}','${usrnamecon.text}','${emailcon.text}','${passcon.text}')");
       if (res > 0) {
         print(res);
         if (!mounted) return;
         Navigator.push(
             context, MaterialPageRoute(builder: (context) => LoginPage()));
       }
     }
   }
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
                child: Form(
                  key: _formkey,
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
                        child: TextFormField(
                          controller: namecon,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            //color: Colors.white,
                          ),
                          onSaved: (value) {
                            namecon.text = value!;
                          },
                          onChanged: (String value){
                            print(value);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700,),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.cyan.shade700 ),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,  color: Colors.red,
                              ),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            border: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(50),
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty || value.trim().length < 5 ) {
                              return 'enter valid name';
                            }
                            return null;
                          },
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: usrnamecon,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            //color: Colors.white,
                          ),
                          onSaved: (value) {
                            usrnamecon.text = value!;
                          },
                          onChanged: (String value){
                            print(value);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700,),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.cyan.shade700 ),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,  color: Colors.red,
                              ),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            border: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              // color: Colors.white,
                            ),
                            labelText: 'User name',
                            labelStyle: TextStyle(
                              color: Colors.cyan.shade700,
                            ),
                            filled: true,
                            fillColor: Color(0x20ffffff),
                            focusColor: Colors.red,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty || value.trim().length < 3 ) {
                              return 'user name must be more than 3 characters';
                            }
                            return null;
                          },
                        ),
                      ),


                      //SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: emailcon,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            //color: Colors.white,
                          ),
                          onChanged: (String value){
                            print(value);
                          },
                          onSaved: (value) {
                            emailcon.text = value!;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700,),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.cyan.shade700 ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              //borderRadius: BorderRadius.circular(50),
                            ),
                            border: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(50),
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty || !value.contains('@') ) {
                              return 'enter valid email';
                            }
                            return null;
                          },
                        ),
                      ),

                     // SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passcon,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 200,
                          obscureText: !_isVisible,
                          style: TextStyle(
                            //color: Colors.white,
                          ),
                          onSaved: (value) {
                            passcon.text = value!;
                          },
                          onChanged: (String value){
                            print(value);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.cyan.shade700,),
                              //borderRadius: BorderRadius.circular(75),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.cyan.shade700 ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,  color: Colors.red,
                              ),
                              //borderRadius: BorderRadius.circular(100),
                            ),
                            border: OutlineInputBorder(
                             // borderRadius: BorderRadius.circular(100),
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
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .length < 6) {
                              return 'password must be more than 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passconfirm,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 200,
                          obscureText: !_isVisible,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          onSaved: (value) {
                            passconfirm.text = value!;
                          },
                          onChanged: (String value){
                            print(value);
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3, color: Colors.cyan.shade700,),
                             // borderRadius: BorderRadius.circular(75),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.cyan.shade700 ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,  color: Colors.red,
                              ),
                              //borderRadius: BorderRadius.circular(100),
                            ),
                            border: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(100),
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
                          validator: (value) {
                            if ( passcon.text != passconfirm.text) {
                              return 'password not match';
                            }
                            return null;
                          },
                        ),

                      ),

                      ElevatedButton(onPressed: (){
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home_Page()),);
                        setState(() {});*/
                        /*if(_checkEmailExistence()==true){
                          _showResultDialog('email already exsists');
                        }
                        else{
                          _submit;
                        }*/
                        _checkEmailExistence();
                        setState(() {

                        });
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
          ),
      );
  }
}
