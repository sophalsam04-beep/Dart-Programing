import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  const HomePage({super.key});

  Future<Map<String, dynamic>> loadJson() async {
    // iniatialize new values
    final JsonString = await rootBundle.loadString("assets/file.json");

    return jsonDecode(JsonString);
  }

  // Json File read
  Future<Map<String, dynamic>> loaded() async {
    // iniatialize
    final json = await rootBundle.loadString("assets/store.json");

    return jsonDecode(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Json File",
          style: TextStyle(
            fontSize: 29,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            FutureBuilder<Map<String, dynamic>>(
              future: loadJson(),
              builder: (context, snapshot) {
                // check validate
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // store data
                      Text(user["name"]),
                      Text(user["age"].toString()),
                      Text(user["city"]),
                    ],
                  );
                }

                if (snapshot.hasError) {
                  return Text("Error : ${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),

            SizedBox(height: 50),

            FutureBuilder<Map<String, dynamic>>(
              future: loaded(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final ss = snapshot.data!;

                  return Column(
                    children: [
                      Text(ss["id"].toString()),
                      Text(ss["name"]),
                      Text(ss["role"].toString()),
                    ],
                  );
                }

                if (snapshot.hasError) {
                  return Text("Error : ${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
