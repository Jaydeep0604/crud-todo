// import 'package:crud_todo/blocs/bloc_exports.dart';
// import 'package:crud_todo/models/task.dart';
// import 'package:flutter/material.dart';

// class TaskTile extends StatelessWidget {
//   const TaskTile({
//     Key? key,
//     required this.task,
//   }) : super(key: key);

//   final Task task;

//   void _RemoveOrDeleteTask(BuildContext ctx, Task task) {
//     task.isDeleted!
//         ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
//         : ctx.read<TasksBloc>().add(RemoveTask(task: task));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(task.title,style: TextStyle(decoration: task.isDone! ?TextDecoration.lineThrough:null),),
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: (value) {
//             context.read<TasksBloc>().add(UpdateTask(task: task));
//           }),
//           onLongPress: ()=> _RemoveOrDeleteTask(context, task)

//     );
//   }
// }

import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/models/task.dart';
import 'package:crud_todo/ui/edit_task_screen.dart';
import 'package:crud_todo/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _RemoveOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                task.isFavorite == false
                    ?const Icon(
                        Icons.star_outline_outlined,
                        color: Palette.black,
                      )
                    :const Icon(
                        Icons.star,
                        color: Palette.black,
                      ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              decoration: task.isDone!
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      //for current date and time
                      //Text(DateTime.now().toString())
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            style: TextStyle(fontSize: 10),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
              //checkColor: Colors.white,
              activeColor: Palette.black,
              side: BorderSide(color: Palette.black, width: 2),
              value: task.isDone,
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }),
          PopupMenu(
              task: task,
              likeOrDislikeCallback: ()=>context.read<TasksBloc>().add(MarkFavouriteOrUnFavouriteTask(task: task)),
              // likeOrDislikeCallback: () {
              //   Navigator.pop(context);
              //   context
              //       .read<TasksBloc>()
              //       .add(MarkFavouriteOrUnFavouriteTask(task: task));
              // },
              editTaskCallback: () {
                Navigator.pop(context);
                _editTask(context);
              },
              cancleOrDeleteCallback: () {
                Navigator.pop(context);
                _RemoveOrDeleteTask(context, task);
              },
              restoreTaskCallback: () {
                context.read<TasksBloc>().add(RestoreTask(task: task));
              }),
        ],
      ),
    );
  }
}


// ListTile(
//       title: Text(task.title,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(decoration: task.isDone! 
//       ?TextDecoration.lineThrough:null),),
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: (value) {
//             context.read<TasksBloc>().add(UpdateTask(task: task));
//           }),
//           onLongPress: ()=>
//           _RemoveOrDeleteTask(context, task),
//     );