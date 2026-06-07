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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Theme")),
      body: Row(
        children: [
          // set flex using to Flexible
          Flexible(flex: 2, child: Icon(Icons.person, size: 60)),
          Flexible(flex: 15, child: Container(height: 100, color: Colors.red)),
          Flexible(
            fit: FlexFit.tight,
            flex: 10,
            child: Container(height: 100, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
