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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Container(height: 100, color: Colors.red),
              ),
              Flexible(
                flex: 2,
                child: Container(height: 100, color: Colors.green),
              ),

              Flexible(
                flex: 2,
                child: Container(height: 100, color: Colors.deepOrange),
              ),
              Flexible(
                flex: 2,
                child: Container(height: 100, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
