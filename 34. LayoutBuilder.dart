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
      body: Column(
        children: [
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return const Text("Tablet");
                }
                return Text("Mobile");
              },
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 500) {
                  return Text("Mobile ");
                }
                return Text("UXUI DESIGNER");
              },
            ),
          ),

          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 500) {
                  return Text("Mobile ");
                }
                return Text("UXUI DESIGNER");
              },
            ),
          ),
        ],
      ),
    );
  }
}
