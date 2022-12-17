import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/ui/my_drawer.dart';
import 'package:crud_todo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = "recycle_bin";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.Primarybackground,
            title: const Text("Recycle Bin",style: TextStyle(color: Colors.black87),),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            child: TextButton.icon(
                                onPressed: ()=>context.read<TasksBloc>().add(DeleteAllTasks()),
                                icon: const Icon(Icons.delete_forever,color: Palette.black,),
                                label: const Text("Delete All Tasks",style: TextStyle(color: Palette.black),)),
                                onTap: null,
                                ),
                              ])
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text("${state.removedTasks.length}Tasks")),
              ),
              TaskList(tasklist: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
