import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  final String text;
  final DateTime dateTime;

  Task(this.text, this.dateTime);
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Task> tasks = [];

  void addTask(String taskText) {
    setState(() {
      tasks.add(Task(taskText, DateTime.now()));
    });
  }

  String convertToWords(int number) {
    final units = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen',
      'Twenty',
    ];
    if (number >= 1 && number <= 20) {
      return units[number - 1];
    }
    return number.toString();
  }

  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat("h:mm a d'th' MMM yyyy");
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Task Board",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Column(
              children: tasks
                  .asMap()
                  .map(
                    (index, task) => MapEntry(
                      index,
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          color: Color.fromARGB(
                            255,
                            234,
                            238,
                            240,
                          ), // Light background color
                          child: Column(
                            children: [
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Task ${convertToWords(index + 1)} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Inter"),
                                    ),
                                    Text("${task.text}"),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${formatDateTime(task.dateTime)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 63, 60, 60),
                                    ),
                                  ),
                                  SizedBox(width: 16), // Adjust spacing
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to add a new task
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTask = '';

              return AlertDialog(
                title: Text("Add Task"),
                content: TextField(
                  onChanged: (value) {
                    newTask =
                        value; // Update the value of the task being entered
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Add the task to the list
                      if (newTask.isNotEmpty) {
                        addTask(newTask);
                      }
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void main() {
  runApp(MaterialApp(home: SecondPage()));
}
