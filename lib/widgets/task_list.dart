
import 'package:flutter/material.dart';
import 'package:my_last_project/widgets/tast_tile.dart';

import '../models/task.dart';
class TasksList extends StatefulWidget {

final List<Task> tasks;
TasksList(this.tasks);
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
     return TaskTile(taskTitle: widget.tasks[index].name,
       ischecked:widget.tasks[index].isdone,
       checkBoxCallBack:
           (bool checkBoxState){
         setState(() {
           widget.tasks[index].toggleDone();
         }
         );}


     );
    },
    itemCount: widget.tasks.length,
    );
  }
}
