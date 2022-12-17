import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/models/task.dart';
import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/services/guid_gen.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({ Key? key }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController discriptioncontroller = TextEditingController();
    return Container(
      color: Palette.Primarybackground,
      padding: EdgeInsets.symmetric(horizontal:5),
      child: Column(
        children: [
          SizedBox(height: 5,),
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 20,color: Palette.black,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child: TextField(
              autofocus: true,
              controller: titlecontroller,
              decoration:  InputDecoration(
                hintText: ("Title"), 
                fillColor: Palette.secondarybackground,
                filled: true,
                disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color:Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color: Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color:Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color: Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color: Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
              ),
              
            ),
          ),
          SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,),
             child: TextField(
              
              autofocus: true,
              controller: discriptioncontroller,
              //minLines: 3,
              // maxLength: 5,
              decoration:  InputDecoration(
                hintText: ("Discription"),
                fillColor: Palette.secondarybackground,
                filled: true,
                disabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 3, color:Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color:Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color: Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color:Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 0, color: Palette.secondarybackground),
                    borderRadius: BorderRadius.circular(10),
                  ),
                
              ),
          ),
           ),
           SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Palette.buttoncolor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
              ),
                  Container(height: 35,
                  width: 100,
                    child: ElevatedButton(
              onPressed: () {
                var task = Task(
                    title: titlecontroller.text,
                    discription: discriptioncontroller.text,
                    date: DateTime.now().toString(),
                    id: GUIDGen.generate(),
                    );
                context.read<TasksBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              },
              child: const Text("Add")),
                  )
            ],
          ),
          SizedBox(height: 15,)
          
        ],
      ),
    );
  }
}
