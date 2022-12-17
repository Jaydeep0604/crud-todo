import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/models/task.dart';
import 'package:crud_todo/services/guid_gen.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({Key? key,required this.oldTask}) : super(key: key);
  final Task oldTask;

  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController(text: oldTask.title);
    TextEditingController discriptioncontroller = TextEditingController(text: oldTask.discription);
    return Container(
       color: Palette.Primarybackground,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          
          const Text(
            "Edit Task",
            style: TextStyle(fontSize: 20,color: Palette.black,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              autofocus: true,
              controller: titlecontroller,
              decoration: InputDecoration(
                hintText: "Title",
                fillColor: Palette.secondarybackground,
                filled: true,
                disabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 3, color:Palette.secondarybackground),
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
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              autofocus: true,
              controller: discriptioncontroller,
              //minLines: 3,
              // maxLength: 5,
              decoration:  InputDecoration(
               hintText :"Discription",
               
               fillColor: Palette.secondarybackground,
                  filled: true,
                  disabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(width: 3, color:Palette.secondarybackground),
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
                    child: const Text("cancle")),
              ),
              Container(
                height: 35,
                  width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      if (titlecontroller.text.isNotEmpty) {
                        var editedTask = Task(
                          title: titlecontroller.text,
                          id: GUIDGen.generate(),
                          discription: discriptioncontroller.text,
                          isDone: false,
                          isFavorite: oldTask.isFavorite,
                          date: DateTime.now().toString(),
                        );
                        context
                            .read<TasksBloc>()
                            .add(EditTask(oldTask: oldTask, newTask: editedTask));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save")),
              )
            ],
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}
