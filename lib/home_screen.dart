import 'package:flutter/material.dart';
import 'package:to_do_app/model/to_do.dart';
import 'package:to_do_app/to_do_items.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final todosList = ToDo.todoList();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.black54, size: 30),
              Container(
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(Icons.person, size: 20, color: Colors.white),
                ),
                //
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.pink[50],

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black12,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 20,
                    minWidth: 20,
                  ),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      "To Do list",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (ToDo todo in widget.todosList) ToDoItems(todo: todo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// child: ClipRect(
//               //   child: Image.network("assets/image/my_pp_size_ photo.jpg"),
//               // ),