import 'package:flutter/material.dart';
import 'package:my_last_project/screens/add_task_scteen.dart';
import 'package:my_last_project/widgets/task_list.dart';

import 'TaskScreen.dart';
import 'models/task.dart';
class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}




class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks=[

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
         ElevatedButton(onPressed:  () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoutesPage()),
        );
        }, child:Text("Add Students info")),
          PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.share,color: Colors.black,),
                    title: Text('Share the App',),
                  ),
                ),
              ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context,
            isScrollControlled: true,
            builder:( context)=> AddTaskScreen((newTaskTitle){
              setState(() {
                tasks.add(Task(name: newTaskTitle));
              });
     Navigator.pop(context);
            }));
      },
      backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.deepOrangeAccent,

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60,right: 30,bottom: 30,left: 30),
            child: Column(
            children: [

              // ElevatedButton(
              //     onPressed:  () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => AddScreen()),
              //   );
              // }, child:Text("Add Students info")),


              Text('${tasks.length} Tasks have been pointed ',style: TextStyle(color: Colors.white,fontSize:20 ),
              ),

            ],

            ),
          ),
          Expanded(
            child:Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),

                  )
              ),
              child: TasksList(tasks),
            ),
          ),
        ],
      ),
    );
  }
}



// ListTile(
// leading: Icon(Icons.person),
// title: const Text(
// 'About',
// style: TextStyle(fontSize: 20),
// ),
//
// ),
