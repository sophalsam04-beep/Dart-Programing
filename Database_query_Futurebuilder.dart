import 'package:advance_mobile/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  Homepage({super.key});
final db = DatabaseHelper();
  

  @override
  Widget build(BuildContext context) {

    final dbhelper = DatabaseHelper();
    return Scaffold(
      appBar: AppBar(title: Text("sqflite used FutureBuilder")),
      body: Center(
        child: FutureBuilder<List<Map<String,dynamic>>>(
          future: dbhelper.getStudent(),
         
         builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
           }
           if(snapshot.hasError){
                return Text("Error : ${snapshot.error}");
           }

           // check hasData
           if(!snapshot.hasData || snapshot.data!.isEmpty){
                return const Center(
                  child: Text("No data...!"),
                );
           }


           final student = snapshot.data!;
           return ListView.builder(
            itemCount: student.length,
            itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(student[index]['id'].toString()),
                  title: Text(student[index]['name']),
                  subtitle: Text(student[index]['role']),
              );
            },
           );
         },
         ),
      ),
    );
  }
}
