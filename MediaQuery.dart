import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Media Query in flutter")),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3 - 40,
              ),
            ),

            Flexible(
              flex: 3,
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),

            Flexible(
              flex: 3,
              child: Container(
                color: Colors.orangeAccent,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),

            Flexible(
              flex: 3,
              child: Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
