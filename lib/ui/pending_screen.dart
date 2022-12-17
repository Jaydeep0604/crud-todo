import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/models/task.dart';
import 'package:crud_todo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class PendingTasksScreen extends StatelessWidget {
const PendingTasksScreen({Key? key}) : super(key: key);
 static const id = "tasks_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasklist = state.pendingTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text("${tasklist.length} Pending | ${state.complatedTasks.length} Complated")),
              ),
              TaskList(tasklist: tasklist)
            ],
          );
      },
    );
  }
}
