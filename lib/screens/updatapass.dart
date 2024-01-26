import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heath_care_test/screens/profile.dart';

import '../DBsql.dart';
import '../session_manager.dart';

class upadte_pass extends StatefulWidget {
  const upadte_pass({super.key});

  @override
  State<upadte_pass> createState() => _upadte_passState();
}

class _upadte_passState extends State<upadte_pass> {
  sqldb sql=sqldb();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Map<String, dynamic>? userData;


  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController passcon = TextEditingController();
  var _isVisible=false;
bool ch=false;

  Future<void> _updatePassword() async {
    String? username = SessionManager.username;
    if (username != null) {
      String oldPassword = _oldPasswordController.text;
      String newPassword = _newPasswordController.text;

      int result = await sql.updatePassword(username, oldPassword, newPassword);

      if (result == -1) {
        _showResultDialog('Incorrect old password');
        ch = false;
      } else {
        _oldPasswordController.clear();
        _newPasswordController.clear();
        passcon.clear();
        ch = true ;
      }
    }
  }


  _update() async {
    final valid = _formkey.currentState!.validate();

    if (valid) {
      _formkey.currentState!.save();

      await _updatePassword();
      if(ch) {
        setState(() {
          Navigator.of(context).pop(MaterialPageRoute(builder: (context) =>
              profile()));
          _showResultDialog('Password updated successfully');
        });

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade500,
        title: Text(
          'Change password',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _oldPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 200,
                    obscureText: !_isVisible,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onSaved: (value) {
                      _oldPasswordController.text = value!;
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3, color: Colors.cyan.shade600,),
                        //borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.cyan.shade600 ),
                        //borderRadius: BorderRadius.circular(50),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        //borderRadius: BorderRadius.circular(100),
                      ),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible ? Icons.visibility_off : Icons
                            .visibility),
                        onPressed: () =>
                            setState(() {
                              _isVisible = !_isVisible;
                            }),
                      ),
                      labelText: 'old Password',
                      labelStyle: TextStyle(
                        color: Colors.cyan.shade700,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _newPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 200,
                    obscureText: !_isVisible,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onSaved: (value) {
                      _newPasswordController.text = value!;
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3, color: Colors.cyan.shade600,),
                        //borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.cyan.shade600 ),
                        //borderRadius: BorderRadius.circular(50),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        //borderRadius: BorderRadius.circular(100),
                      ),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible ? Icons.visibility_off : Icons
                            .visibility),
                        onPressed: () =>
                            setState(() {
                              _isVisible = !_isVisible;
                            }),
                      ),
                      labelText: 'new Password',
                      labelStyle: TextStyle(
                        color: Colors.cyan.shade700,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passcon,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 200,
                    obscureText: !_isVisible,
                    style: TextStyle(
                      color: Colors.black,
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
                      fillColor: Colors.grey.shade100,
                      focusColor: Colors.red,
                    ),
                    validator: (value) {
                      if ( _newPasswordController.text != passcon.text) {
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
                  _update();

                  setState(() {

                  });
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.cyan.shade800,
                  ),
                  child: Text(
                    'Update password',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),


    );
  }
}
