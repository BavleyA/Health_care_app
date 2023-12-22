import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    Database mydb = await openDatabase(path, onCreate: _onCreate ,version: 1 ,onUpgrade: _onUpgrade);
    return mydb;

  }
  _onUpgrade(Database db , int odv, int nwv){

    print("upgraded");

  }

_onCreate(Database db,int version) async{
    Batch batch =db.batch();
    batch.execute('''
    CREATE TABLE "USERS"(
    user_id INTEGER NOT NULL PRIMARY KEY ,
    name TEXT NOT NULL,
    user_name TEXT UNIQUE,
    email TEXT NOT NULL UNIQUE,
    user_pass TEXT NOT NULL
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
}