import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  // list todos
  List<Map<String, dynamic>> todos = [];

  @override
  void initState() {
    loadTodos();
    super.initState();
  }

  Future<void> saveTodos() async {
    // shared preference data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String JsonString = jsonEncode(todos);
    // set string to todos
    await prefs.setString('todos', JsonString);
  }

  // get jsonstring
  Future<void> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Jsonstring = prefs.getString('todos');

    if (Jsonstring != null) {
      setState(() {
        todos = List<Map<String, dynamic>>.from(jsonDecode(Jsonstring));
      });
    }
  }

  void addTask() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      todos.add({"title": controller.text, "done": false});
    });

    controller.clear();
    saveTodos();
  }

  void deleteTodos(int index) {
    setState(() {
      todos.removeAt(index);
    });

    saveTodos();
  }

  void toggleTask(int index) {
    setState(() {
      todos[index]['done'] = !todos[index]['done'];
    });

    saveTodos();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Apps", style: TextStyle(fontSize: 30))),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter task",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: addTask,
                  child: const Text("Add"),
                ),
              ],
            ),

            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: todos[index]['done'],
                        onChanged: (_) => toggleTask(index),
                      ),

                      title: Text(
                        todos[index]["title"],
                        style: TextStyle(
                          decoration: todos[index]['done']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      trailing: IconButton(
                        onPressed: () => deleteTodos(index),
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
