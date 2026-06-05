import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Future for Update UI screen

  Future<String> fetchuser() async {
    await Future.delayed(Duration(milliseconds: 200));

    return "Fetch user loaded...!";
  }

  Future<String> validate() async {
    await Future.delayed(Duration(milliseconds: 200));

    return "Validate user...!";
  }

  // API request

  Future<List<String>> checkin() async {
    await Future.delayed(Duration(milliseconds: 100));

    return ["Leakha", "Sophal", "Virak", "Theara"];
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FutureBuilder",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
        body: Center(
          child: FutureBuilder(future: checkin(), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            if(snapshot.hasError){
              return Text("Error");
            }

            final users = snapshot.data!;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]),
                );
              },
            );
          },),
        ),
    );
  }
}
