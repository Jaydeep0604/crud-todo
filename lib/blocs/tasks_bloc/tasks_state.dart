part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> complatedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  const TasksState({
    this.pendingTasks = const <Task>[],
    this.complatedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[]
  
  });

  @override
  List<Object> get props => [pendingTasks,removedTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'complatedTasks': complatedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
    pendingTasks: List<Task>.from(map['pendingTasks'] ?.map((x)=>Task.fromMap(x))),
    complatedTasks: List<Task>.from(map['complatedTasks'] ?.map((x)=>Task.fromMap(x))),
    favoriteTasks: List<Task>.from(map['favoriteTasks'] ?.map((x)=>Task.fromMap(x))),
    removedTasks: List<Task>.from(map['removedTasks'] ?.map((x)=>Task.fromMap(x))),
      
      );
      
  }
}
