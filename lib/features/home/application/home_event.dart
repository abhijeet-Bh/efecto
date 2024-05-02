part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class LoadTasksEvent extends HomeEvent {
  final DateTime selectedDate;
  const LoadTasksEvent(this.selectedDate);
  @override
  List<Object> get props => [selectedDate];
}

final class AddTasksEvent extends HomeEvent {
  final TaskModel task;
  const AddTasksEvent(this.task);
  @override
  List<Object> get props => [task];
}

final class DeleteTasksEvent extends HomeEvent {
  final TaskModel task;
  const DeleteTasksEvent(this.task);
  @override
  List<Object> get props => [task];
}

final class EditTasksEvent extends HomeEvent {
  final TaskModel task;
  const EditTasksEvent(this.task);
  @override
  List<Object> get props => [task];
}
