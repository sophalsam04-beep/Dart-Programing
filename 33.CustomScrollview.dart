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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text("Flutter Apps"), floating: true),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(title: Text("Item : ${index}"));
            }),
          ),
        ],
      ),
    );
  }
}
