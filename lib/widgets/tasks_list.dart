import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/models/task.dart';
import 'package:crud_todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasklist,
  }) : super(key: key);

  final List<Task> tasklist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          
        child: Container(
          color: Palette.buttoncolor,
          child: Expanded(
            child: SingleChildScrollView(
              child: ExpansionPanelList.radio(
                  children: tasklist
                      .map((task) => ExpansionPanelRadio(
                          value: task.title,
                          headerBuilder: (context, isOpen) => TaskTile(task: task),
                          body: ListTile(
                            title: ListTile(
                              title: SelectableText.rich(TextSpan(children: [
                                TextSpan(
                                    text: 'Text\n',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: task.title),
                                TextSpan(
                                    text: '\n\nDescription\n',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: task.discription),
                              ])),
                            ),
                          )))
                      .toList()),
            ),
          ),
        ),
      ),
    );
  }
}

// Expanded(
//       child: ListView.builder(
//           // scrollDirection: Axis.vertical,
//           // shrinkWrap: true,
//           itemCount: tasklist.length,
//           itemBuilder: (context, index) {
//             var task = tasklist[index];
//             return TaskTile(task: task);
//           }),
//     )