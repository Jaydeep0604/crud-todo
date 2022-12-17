import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/ui/complated_tasks_screen.dart';
import 'package:crud_todo/ui/favorite_tasks_screen.dart';
import 'package:crud_todo/ui/my_drawer.dart';
import 'package:crud_todo/ui/pending_screen.dart';
import 'package:flutter/material.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const ComplatedTasksSceen(), 'title': 'Complated Tasks'},
    {'pageName': const FavoriteTasksSceen(), 'title': 'Favorite Tasks'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            )
            );
  }
  // void _addTask(BuildContext context) {
  //   AlertDialog(
  //     backgroundColor: Color.fromARGB(255, 243, 238, 194),
  //   actions: [AddTaskScreen()],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor:Palette.Primarybackground,
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        // actions: [
        //   IconButton(
        //       onPressed: () => _addTask(context), icon: const Icon(Icons.add))
        // ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
            backgroundColor: Palette.Primarybackground,
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add,color: Palette.black,),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Palette.Primarybackground,
        fixedColor: Palette.black,
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_rounded,),
              label: "Pending Tasks",),
          BottomNavigationBarItem(
              icon: Icon(Icons.done,), label: "Complated Tasks",),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,), label: "Favorte Tasks"),
        ],
      ),
    );
  }
}
