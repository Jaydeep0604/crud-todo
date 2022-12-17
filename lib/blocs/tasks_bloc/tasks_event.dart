part of 'tasks_bloc.dart';

 class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}
class AddTask extends TasksEvent {
  final Task task;
  AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
class RemoveTask extends TasksEvent {
  final Task task;
  RemoveTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
class DeleteTask extends TasksEvent {
  final Task task;
  DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
class UpdateTask extends TasksEvent {
  final Task task;
  UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
class MarkFavouriteOrUnFavouriteTask extends TasksEvent {
  final Task task;
  MarkFavouriteOrUnFavouriteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
class isFavourite extends TasksEvent {
  final Task task;
  isFavourite({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
class EditTask extends TasksEvent {
  final Task oldTask;
    final Task newTask;

  EditTask({
    required this.oldTask,
    required this.newTask
  });

  @override
  List<Object> get props => [oldTask,newTask];
}
class RestoreTask extends TasksEvent {
  final Task task;
  RestoreTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteAllTasks extends TasksEvent{}
