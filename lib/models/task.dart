
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String id;
  final String date;
  final String discription;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  Task({
    required this.title,
    required this.id,
    required this.date,
    required this.discription,
    this.isDone,
    this.isDeleted,
    this.isFavorite
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }
  Task copyWith({
    String? title,
    String? id,
     String? date,
    String? discription,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      date: date ?? this.date,
      discription: id ?? this.discription,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isDeleted ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title,'id':id,'date':date, 'discription':discription, 'isDone': isDone, 'isDeleted': isDeleted};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      discription: map['discription'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  List<Object?> get props => [title,id,date,discription,isDone, isDeleted,isFavorite];
}
