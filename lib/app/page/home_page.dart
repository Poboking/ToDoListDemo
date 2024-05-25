import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:youtube_course_demo/app/data/database/todolist_database.dart';
import 'package:youtube_course_demo/app/utils/element/dialog_box.dart';
import 'package:youtube_course_demo/app/utils/element/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();
  final _box = Hive.box("box");
  final _controller = TextEditingController();
  TodolistDatabase db = TodolistDatabase();

  @override
  void initState() {
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TO DO         ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.yellow[500],
        elevation: 10,
      ),

      drawer: Drawer(
        backgroundColor: Colors.deepPurple[200],
        child:  Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 48,
              ),
            ),

            //home page
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('H O M E'),
              onTap: (){
                //go to home
                // Navigator.pushNamed(context, "/homepage");
                Navigator.of(context).pop(true);
              },
            ),

            //setting page
             ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('S E T T I N G'),
              onTap: (){
                Navigator.pushNamed(context, "/settingpage");
              },
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: _controller,
                onSave: saveNewTask,
                onCancel: () => Navigator.of(context).pop(true),
              );
            },
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),

      //ListView`s itemView must have fixed height and width!
      body: ListView.builder(
          itemCount: db.toDoList.length, itemBuilder: _itemBuild),
      backgroundColor: Colors.yellow[100],
    );
  }

  //build listview item
  Widget? _itemBuild(BuildContext context, int index) {
    return ToDoTile(
      taskName: db.toDoList[index][0],
      taskCompleted: db.toDoList[index][1],
      onChanged: (value) => changeTask(index),
      deleteFunction: (context) => _deleteFunction(index),
    );
  }

  //change task
  void changeTask(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      db.updateDataBase();
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //delete task
  void _deleteFunction(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDataBase();
    });
  }
}
