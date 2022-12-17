import 'package:crud_todo/blocs/bloc_exports.dart';
import 'package:crud_todo/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<EditTask>(_EditTask);
    on<RestoreTask>(_RestoreTask);
    on<MarkFavouriteOrUnFavouriteTask>(_MarkFavouriteOrUnFavouriteTask);
    on<DeleteAllTasks>(_DeleteAllTasks);
  }
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      complatedTasks: state.complatedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final stete = this.state;
    final task = event.task;

    List<Task> pendingTasks = stete.pendingTasks;
    List<Task> favoriteTasks = stete.favoriteTasks;
    List<Task> complatedtasks = stete.complatedTasks;
    task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            complatedtasks = List.from(complatedtasks)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            complatedtasks = List.from(complatedtasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false))
          };
    emit(TasksState(
        pendingTasks: pendingTasks,
        complatedTasks: complatedtasks,
        favoriteTasks: favoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks,
        complatedTasks: state.complatedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        complatedTasks: List.from(state.complatedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  void _MarkFavouriteOrUnFavouriteTask(MarkFavouriteOrUnFavouriteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> complatedTasks = state.complatedTasks;
    List<Task> favouriteTasks = state.favoriteTasks;
    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favouriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favouriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = complatedTasks.indexOf(event.task);
        complatedTasks = List.from(complatedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favouriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = complatedTasks.indexOf(event.task);
        complatedTasks = List.from(complatedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favouriteTasks.remove(event.task);
      }
    }
    emit(TasksState(
        pendingTasks: pendingTasks,
        complatedTasks: complatedTasks,
        favoriteTasks: favouriteTasks,
        removedTasks: state.removedTasks));
  }

  void _EditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> favouriteTasks = state.favoriteTasks;
    if (event.oldTask.isFavorite == true) {
      favouriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        complatedTasks: state.complatedTasks..remove(event.oldTask),
        favoriteTasks: favouriteTasks,
        removedTasks: state.removedTasks));
  }

  void _RestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        pendingTasks: List.from(state.pendingTasks)
          ..insert(
              0,
              event.task.copyWith(
                  isDeleted: false, isDone: false, isFavorite: false)),
        complatedTasks: state.complatedTasks,
        favoriteTasks: state.favoriteTasks));
  }

  void _DeleteAllTasks(DeleteAllTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      removedTasks: List.from(state.removedTasks)..clear(),
      pendingTasks: state.pendingTasks,
      complatedTasks: state.complatedTasks,
      favoriteTasks: state.favoriteTasks,
    ));
  }
  // @override
  // TasksState? fromJson(Map<String, dynamic> json) {
  //   return TasksState.fromMap(json);
  // }

  // @override
  // Map<String, dynamic>? toJson(TasksState state) {
  //   return state.toMap();
  // }

  

  // @override
  // TasksState? fromJson(Map<String, dynamic> json) {
  //   return TasksState.fromMap(json);
  // }

  // @override
  // Map<String, dynamic>? toJson(TasksState state) {
  //   return state.toMap();
  // }

  
}
