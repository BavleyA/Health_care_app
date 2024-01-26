
import 'package:flutter/material.dart';
import 'package:heath_care_test/DBsql.dart';
import 'package:heath_care_test/session_manager.dart';
class bmirecords extends StatefulWidget {
  const bmirecords({super.key});

  @override
  State<bmirecords> createState() => _bmirecordsState();
}

class _bmirecordsState extends State<bmirecords> {
  sqldb sql=sqldb();
  Future<List<Map>> read() async{
    //SessionManager.setUser(username);
    List<Map> res =await sql.getData("SELECT * FROM BMIREC");
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade200,
        title:  Text('My Records',
          style: TextStyle(
              color: Colors.black, fontSize: 20),
        ),
          leading: Icon(
            Icons.
            menu_book_outlined, // back here look at again//////////////
            color: Colors.black,
          ),

      ),
      body: Container(
        child: ListView(
          children: [
            FutureBuilder(future: sql.getAllBMIRecordsForUser(), builder: (BuildContext context , AsyncSnapshot<List<Map>> snapshot){

              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context , i){

                    return Card(
                      color: Colors.cyan.shade50,
                      child: ListTile(
                        title: Text("${snapshot.data![i]['bmi']}"),
                        subtitle: Text("heiht: ${snapshot.data![i]['height']}Metre Weight: ${snapshot.data![i]['weight']}KG"),
                        trailing: Text("${snapshot.data![i]['date']}"),

                      ),
                    );

                });

              }
              return Center(child: CircularProgressIndicator());
            })
          ],
        ),
      )


    );
  }
}
