import 'dart:async';
import 'dart:ffi';

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
  final StreamController<int> controller = StreamController<int>();
  int counter = 0;

  void increment() {
    counter++;

    controller.sink.add(counter);
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  final StreamController<double> data = StreamController<double>();
  int counts = 0;

  void decrement() {
    counts--;

    controller.sink.add(counts);
  }

  final StreamController<int> checks = StreamController<int>();

  int c = 0;

  void add() {
    c++;

    controller.sink.add(c);
  }

  @override
  void initState() {
    add();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StreamController + StreamBuilder")),
      body: Center(
        child: StreamBuilder(
          stream: controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Text("+"),
      ),
    );
  }
}
