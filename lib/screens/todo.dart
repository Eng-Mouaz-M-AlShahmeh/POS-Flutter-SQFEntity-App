//
// import 'package:flutter/material.dart';
// import 'package:sells_app/repositories/orm_config.dart';
//
// class TodoScreen extends StatefulWidget {
//   const TodoScreen({Key? key}) : super(key: key);
//
//   @override
//   _TodoScreenState createState() => _TodoScreenState();
// }
//
// class _TodoScreenState extends State<TodoScreen> {
//   List<InvoiceDetail> todos = [];
//   loadData() async {
//     todos = await Todo().select().toList();
//
//     setState(() { });
//   }
//
//   todoAdd(String todoTitle) async {
//     Todo todoToAdd = new Todo();
//     todoToAdd.title = todoTitle;
//     todoToAdd.completed = false;
//     await todoToAdd.save();
//
//     loadData();
//   }
//
//   showTodoAddDialog() {
//     String newTitle = '';
//     return showDialog(
//         context: context,
//         builder: (_) => new AlertDialog(
//           title: Text('Add Task'),
//           content: TextField(
//             onChanged: (val) => newTitle = val,
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//                 onPressed: () async {
//                   todoAdd(newTitle);
//                   Navigator.pop(context);
//                   },
//                 child: Text('Add')
//             ),
//
//           ],
//         ),
//     );
//   }
//
//   @override
//   void initState() {
//     loadData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 await Todo().select().completed.equals(true).delete();
//                 loadData();
//               },
//               icon: Icon(Icons.delete),),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             onTap: () async {
//               todos[index].completed = !todos[index].completed!;
//               await todos[index].save();
//               loadData();
//             },
//             title: Text('${todos[index].title ?? ""}'),
//             trailing: todos[index].completed == true ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
//           );
//         }
//       ),
//       floatingActionButton: IconButton(
//         icon: Icon(Icons.add),
//         onPressed: showTodoAddDialog,
//       ),
//     );
//   }
// }
