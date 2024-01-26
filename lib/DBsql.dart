import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:heath_care_test/session_manager.dart';
import 'package:heath_care_test/screens/BMI.dart';
class sqldb{

  static Database? _db ;

  Future<Database?> get db async{
    if(_db==null){
      _db= await initialDb();
      return _db;
    }
    else {
      return _db;
    }
  }

  initialDb()async{
    String dbPath=await getDatabasesPath();
    String path = join(dbPath,'healthApp.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate ,version: 2 ,onUpgrade: _onUpgrade);
    return mydb;

  }
  _onUpgrade(Database db , int odv, int nwv){

    print("upgraded");

  }

_onCreate(Database db,int version) async{
    Batch batch =db.batch();
    batch.execute('''
    CREATE TABLE "USERS"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    user_name TEXT UNIQUE,
    email TEXT NOT NULL UNIQUE,
    user_pass TEXT NOT NULL
    )
    ''');
    batch.execute('''
    CREATE TABLE "BMIREC"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT,
        height REAL,
        weight REAL,
        bmi REAL,
        date TEXT,
        FOREIGN KEY(user_name) REFERENCES USERS(user_name)
    )
    ''');
    print("created");
    await batch.commit();

}

getData(String sql ) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);

    return response;
}
  Future<List<Map<String, dynamic>>> getData1(String query, List<dynamic> args) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery(query, args);

    return response;
  }
insertData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
  updateData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
  deleteData(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }


  deletemydatabase()async{
    String dbPath=await getDatabasesPath();
    String path = join(dbPath,'healthApp.db');
    await deleteDatabase(path);
  }


  Future<bool> doesEmailExist(String email) async {
    Database? mydb = await db;
    var result = await mydb!.rawQuery('SELECT * FROM USERS WHERE USERS.email = ?', [email]);
    return result.isNotEmpty;
  }

  Future<bool> doesUserExist(String Username) async {
    Database? mydb = await db;
    var result = await mydb!.rawQuery('SELECT * FROM USERS WHERE USERS.user_name = ?', [Username]);
    return result.isNotEmpty;
  }

  /*Future<List<Map<String, dynamic>>> getAllBMIRecordsForUser(int userId) async {
    Database? mydb = await db;
    return await mydb!.query('BMIREC', where: 'userId = ?', whereArgs: [userId]);
  }*/


  Future<int> insertBMIRecord( double height, double weight, double bmi, String date) async {
    String? userName = SessionManager.username;
    if (userName == null) {
      print('Error: User not signed in');
      return 0;
    }

    Database? mydb = await db;
    return await mydb!.insert('BMIREC', {
      'user_name': userName,
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'date': date,
    });
  }

  Future<List<Map<String, dynamic>>> getAllBMIRecordsForUser() async {
    String? userName = SessionManager.username;
    if (userName == null) {
      print('Error: User not signed in');
      return [];
    }

    Database? mydb = await db;
    return await mydb!.query('BMIREC', where: 'user_name = ?', whereArgs: [userName]);
  }

  Future<Map<String, dynamic>?> getUserData(String username) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> result = await mydb!.query('USERS', where: 'user_name = ?', whereArgs: [username]);

    if (result.isNotEmpty) {
      return result.first;
    }
    else
    {
      return null;
    }
  }

  Future<int> updateUserData(String username, String newName, String newEmail) async {
    Database? mydb = await db;
    return await mydb!.update(
      'USERS',
      {'name': newName, 'email': newEmail},
      where: 'user_name = ?',
      whereArgs: [username],
    );
  }


  Future<int> updatePassword(String username, String oldPassword, String newPassword) async {
    Database? mydb = await db;

    // Check if the old password is correct
    var user = await mydb!.query('USERS',
        where: 'user_name = ? AND user_pass = ?', whereArgs: [username, oldPassword]);

    if (user.isEmpty) {
      // Old password is incorrect, return an indicator (e.g., -1)
      return -1;
    }

    // Old password is correct, proceed with the update
    return await mydb.update(
      'USERS',
      {'user_pass': newPassword},
      where: 'user_name = ?',
      whereArgs: [username],
    );
  }
  

}
