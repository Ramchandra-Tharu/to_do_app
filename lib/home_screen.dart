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
  List<ToDo> todosList = ToDo.todoList();

  List<ToDo> _foundTodo = [];
  @override
  void initState() {
    _foundTodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _todoController = TextEditingController();

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

      body: Stack(
        children: [
          Container(
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
                    onChanged: (value) => _runFilter(value),
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
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "To Do list",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (ToDo todo in _foundTodo.reversed)
                          ToDoItems(
                            todo: todo,
                            onTodoChanged: _handleToDoChange,
                            onDeleteItem: _deleteTodoItem,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: "Add new todo",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  child: ElevatedButton(
                    child: Text("+", style: TextStyle(fontSize: 30)),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(50, 50),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String Todo) {
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: Todo,
        ),
      );
    });

    var _todoController;
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> result = [];
    if (enteredKeyword.isEmpty) {
      result = todosList;
    } else {
      result =
          todosList
              .where(
                (item) => item.todoText!.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
              )
              .toList();
    }
    setState(() {
      _foundTodo = result;
    });
  }
}

// void _handleToDoChange(ToDo todo) {
//   setState(() {
//     todo.isDone = !todo.isDone;
//   });  
// }
 
// child: ClipRect(
//               //   child: Image.network("assets/image/my_pp_size_ photo.jpg"),
//               // ),