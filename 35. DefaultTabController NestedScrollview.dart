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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text("Flutter Apps"),
                pinned: true,
                expandedHeight: 300,
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Flutter"),
                    Tab(text: "Graphic designer"),
                    Tab(text: "UXUI DESIGNER"),
                    Tab(text: "MOBILE APPS"),
                  ],
                ),
              ),
            ];
          },

          body: TabBarView(
            children: [
              Center(child: Text("Homescreen")),
              Center(child: Text("Profile Screen")),
              Center(child: Text("UXUI DESIGNER")),
              Center(child: Text("MOBILE APPS")),
            ],
          ),
        ),
      ),
    );
  }
}
