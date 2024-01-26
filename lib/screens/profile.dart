import 'package:flutter/material.dart';
import '../DBsql.dart';
import '../session_manager.dart';
import 'package:heath_care_test/screens/updatapass.dart';

import 'login_page.dart';
class profile extends StatefulWidget {
  const profile({super.key});
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  sqldb sql=sqldb();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Map<String, dynamic>? userData;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController passcon = TextEditingController();
  var _isVisible=false;


  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();

  }

  Future<void> _loadUserData() async {
    String? username = SessionManager.username;
    if (username != null) {
      Map<String, dynamic>? data = await sql.getUserData(username);
      if (data != null) {
        setState(() {
          userData = data;
          _nameController.text = data['name'] ?? '';
          _emailController.text = data['email'] ?? '';
        });
      }
    }
  }

 Future<void> _updateUserData() async {
    String? username = SessionManager.username;
    if (username != null) {
      String newName = _nameController.text;
      String newEmail = _emailController.text;


      bool emailExists = await sql.doesEmailExist(newEmail);

      if (emailExists) {
        _showResultDialog('email already exsists');
      }

      else {
        await sql.updateUserData(username, newName, newEmail);

        await _loadUserData();
        _showResultDialog('your data updated successfully');
        //_emailController.clear();
        setState(() {
          _isEditing = false;
        });
      }
    }
  }

  Future<void> _updatePassword() async {
    String? username = SessionManager.username;
    if (username != null) {
      String oldPassword = _oldPasswordController.text;
      String newPassword = _newPasswordController.text;

      int result = await sql.updatePassword(username, oldPassword, newPassword);

      if (result == -1) {
        _showResultDialog('Incorrect old password');
      } else {
        _showResultDialog('Password updated successfully');
        // Clear the password fields
        _oldPasswordController.clear();
        _newPasswordController.clear();
        passcon.clear();
      }
    }
  }

  /*_submit() async {
    final valid = _formkey.currentState!.validate();

    if (valid) {
      _formkey.currentState!.save();

      if (res > 0) {
        print(res);
        if (!mounted) return;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }
  }*/



  Future<void> _checkEmailExistence() async {
    String email = _emailController.text.trim();
    if (email.isNotEmpty) {
      bool emailExists = await sql.doesEmailExist(_emailController.text);
      if (emailExists) {
        _showResultDialog('email already exsists');
      }
    }
  }
  Future<void> _checkUserExistence() async {
    String usr = _nameController.text.trim();
    if (usr.isNotEmpty) {
      bool userExists = await sql.doesUserExist(_nameController.text);
      //x = emailExists;
      if (userExists) {
        _showResultDialog('User name already exsists');
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
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.person),
          backgroundColor: Colors.cyan.shade200,
          title: Text('Profile Page'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
            ),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () async {

                  await _updateUserData();
                 // _showResultDialog('your data updated successfully');
                  setState(() {
                    _isEditing = false;
                  });
                },
              ),
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isEditing) ...[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextFormField(
                        controller: _nameController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          //color: Colors.white,
                        ),
                        onSaved: (value) {
                          _nameController.text = value!;
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
                          fillColor: Colors.grey.shade100,
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          //color: Colors.white,
                        ),
                        onChanged: (String value){
                          print(value);
                        },
                        onSaved: (value) {
                          _emailController.text = value!;
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
                          fillColor: Colors.grey.shade100,
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

                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => upadte_pass()),);

                      setState(() {

                      });
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.cyan.shade800,
                      ),
                      child: Text(
                        'Change password',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),

                  ]
                  else if (userData != null) ...[

                    CircleAvatar(
                      radius: 73,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dvb.jpg'),
                        radius: 70,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(' ${userData!['name']}', style: TextStyle(fontSize: 25,color:Colors.black,),),
                    Text(' ${userData!['email']}',style: TextStyle(fontSize: 20,color:Colors.black38,)),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width *.9,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade300,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              LoginPage()), (Route<dynamic> route) => false);
                        },
                        child: Text('LOG OUT', style: TextStyle(fontSize: 25,color: Colors.black),),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person,size: 30,color: Colors.cyan.shade600),
                      subtitle: Text('Full Name'),
                      title: Text('${userData!['name']}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle,size: 30,color: Colors.cyan.shade600),
                      subtitle: Text('User Name'),
                      title: Text('${userData!['user_name']}'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email,size: 30, color: Colors.cyan.shade600,),
                      subtitle: Text('Email'),
                      title: Text('${userData!['email']}'),
                    ),
                    /*Text('Name: ${userData!['name']}'),
                    //Text('Username: ${userData!['user_name']}'),
                    Text('Email: ${userData!['email']}'),
                    Text('password: ${userData!['user_pass']}',




                    ),*/

                  ] else ...[
                      Text('Loading user data'), ]
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
