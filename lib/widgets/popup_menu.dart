

import 'package:crud_todo/Palette.dart';
import 'package:crud_todo/models/task.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancleOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  final Task task;
  const PopupMenu({Key? key,
   required this.cancleOrDeleteCallback,
   required this.task,
   required this.likeOrDislikeCallback,
   required this.editTaskCallback,
   required this.restoreTaskCallback
   })
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted==false? ((context) => [
              PopupMenuItem(    
                child: TextButton.icon(
                    onPressed: editTaskCallback,
                    icon: const Icon(Icons.edit,color: Palette.black,),
                    label:  Text("Edit Task",style: TextStyle(color: Palette.black),)),
                onTap:()=>editTaskCallback,
              ),
              PopupMenuItem(
                child: TextButton.icon(
                    onPressed: likeOrDislikeCallback,
                    icon:task.isFavorite==false
                    ? const Icon(Icons.bookmark_add_outlined,color: Palette.black,)
                    : const Icon(Icons.bookmark_remove,color: Palette.black,)
                  ,
                    label: task.isFavorite == false
                    ?const Text("Add To \nBookmark",style: TextStyle(color: Palette.black))
                    :const Text("Remove From \nBookmark",style: TextStyle(color: Palette.black))),
                     
                onTap:null,
              ),
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed:cancleOrDeleteCallback,
                      icon: const Icon(Icons.delete,color: Palette.black,),
                      label: const Text("Delete Task",style: TextStyle(color: Palette.black))),
                  onTap:null)
            ]):(context)=>[
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed:  restoreTaskCallback,
                      icon:const  Icon(Icons.restore_from_trash,color: Palette.black,),
                      label: const Text("Restore",style: TextStyle(color: Palette.black)),),
                  onTap:null),
              PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: cancleOrDeleteCallback,
                      icon: const Icon(Icons.delete_forever,color: Palette.black,),
                      label: const Text("Restore Forever",style: TextStyle(color: Palette.black),)),
                  onTap: null),
                  
            ]
            
            );
  }
}
