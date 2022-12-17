import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/ui/recycle_bin.dart';
import 'package:crud_todo/ui/tabs_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey.shade200,
        child: Column(children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Palette.Primarybackground,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Task Drawer",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                )),
          ),
          
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TabsScreen.id),
                child: ListTile(
                  leading: const Icon(Icons.folder_special,color: Palette.black,),
                  title: const Text("My Tasks "),
                  trailing: Text(
                      "${state.pendingTasks.length} | ${state.complatedTasks.length}"),
                ),
              );
            },
          ),
         Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Divider(thickness: 1.5,),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                child: ListTile(
                  leading: const Icon(Icons.delete,color: Palette.black,),
                  title: const Text("Bin"),
                  trailing: Text("${state.removedTasks.length}"),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Divider(thickness: 1.5,),
          )
          // BlocBuilder<SwitchBloc, SwitchState>(
          //   builder: (context, state) {
          //     return Switch(
          //         value: state.switcValue,
          //         onChanged: (newValue) {
          //           newValue
          //               ? context.read<SwitchBloc>().add(SwitchOnEvent())
          //               : context.read<SwitchBloc>().add(SwitchoffEvent());
          //         });
          //   },
          // )
        ]),
      ),
    );
  }
}
