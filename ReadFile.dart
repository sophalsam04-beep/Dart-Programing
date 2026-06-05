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

  // Read File using to FutureBuilder
  Future<String> readFile() async {
    return await rootBundle.loadString("assets/data.txt");
  }

  Future<String> getFile() async {
    return await rootBundle.loadString("assets/text.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read File using to FutureBuilder")),

      body: Column(
        children: [
          SizedBox(height: 200),
          FutureBuilder<String>(
            future: readFile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text("Error : ${snapshot.error}");
              }

              return Center(
                child: Text(
                  snapshot.data ?? "No data...!",
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),

          SizedBox(height: 30),
          // Future builder for readtextFile
          FutureBuilder(
            future: getFile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text("Error : ${snapshot.error}");
              }

              return Text(
                snapshot.data ?? "No data...!",
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
