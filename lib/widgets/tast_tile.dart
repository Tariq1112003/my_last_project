
import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {

 final bool ischecked;
 final String taskTitle;
 final Function checkBoxCallBack;
 TaskTile({required this.ischecked,required this.taskTitle,required this.checkBoxCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,style: TextStyle(decoration:  ischecked?TextDecoration.lineThrough:null),),
      trailing: Checkbox(
        activeColor: Colors.orange,
        value:ischecked,
        onChanged:(newValue){
          checkBoxCallBack(newValue);
    }

      ),
    );
  }
}

