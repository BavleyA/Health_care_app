import 'package:flutter/material.dart';
class Workouts extends StatelessWidget {
  List photo=[{
    'image':'assets/images/Yoga.jpg',
    'name':'Yoga'
  },{
    'image':'assets/images/pilates.jpg',
    'name':'Pilates'
  },{
    'image':'assets/images/fullBody.jpg',
    'name':'Full body'
  },{
    'image':'assets/images/Stretching.jpg',
    'name':'Stretching'
  },{
    'image':'assets/images/cardio.jpg',
    'name':'Cardio'
  }


  ];
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor:Colors.cyan.shade200,
        centerTitle: true,
        title:const Tab(
          icon: Icon(
            Icons.local_fire_department_outlined,                     // back here look at again//////////////
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Workouts',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontFamily: "Lora"),
            ),
          ),
        ),
      ),
      body :ListView.builder(
        itemCount: photo.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Card(
              color: Colors.cyan.shade50,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      photo[index]['name'],
                      style:const TextStyle(
                          fontSize: 22
                      ),

                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        photo[index]['image'],
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )

                ],
              ),
            ),

          );
        },
      ),
    );
  }
}
