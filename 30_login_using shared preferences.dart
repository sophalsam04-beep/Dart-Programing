import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Nullable values
    await prefs.setString('data', jsonEncode(data));
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    String? d = await prefs.getString('data');
    if (d != null) {
      List<dynamic> decoded = jsonDecode(d);

      setState(() {
        data = decoded.map((a) => Map<String, dynamic>.from(a)).toList();
      });
    }

    emailcontroller.clear();
    passwordcontroller.clear();
  }

  void addData() async {
    if (emailcontroller.text.trim().isEmpty) return;
    if (passwordcontroller.text.trim().isEmpty) return;

    setState(() {
      data.add({
        'email': emailcontroller.text,
        'password': passwordcontroller.text,
        'done': false,
      });
    });

    saveData();
  }

  void deleteData(int index) async {
    setState(() {
      data.removeAt(index);
    });

    saveData();
  }

  void toggleData(int index) async {
    setState(() {
      data[index]['done'] = !data[index]['done'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: "Enter email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => addData(),
                        child: const Text("Add"),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: data[index]['done'],
                        onChanged: (value) => toggleData(index),
                      ),

                      title: Text(
                        data[index]['email'],
                        style: TextStyle(
                          decoration: data[index]['done']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      subtitle: Text(data[index]['password']),

                      trailing: IconButton(
                        onPressed: () => deleteData(index),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
